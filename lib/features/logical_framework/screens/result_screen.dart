import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../providers/logical_framework_provider.dart';
import '../models/comparison_item.dart';
import '../../concern/providers/concern_provider.dart';

class ResultScreen extends ConsumerStatefulWidget {
  final String concernId;

  const ResultScreen({super.key, required this.concernId});

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {
  List<ComparisonItem> _items = [];
  List<String> _choices = [];
  Map<int, double> _totals = {}; // 선택지 인덱스 -> 총점
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final notifier = ref.read(
      logicalFrameworkProvider(widget.concernId).notifier,
    );
    final concernNotifier = ref.read(concernListProvider.notifier);
    final concern = concernNotifier.getConcernById(widget.concernId);

    if (concern == null) return;

    final items = await notifier.getComparisonItems();
    final choices = concern.choices;

    // 각 선택지별 총점 계산
    final totals = <int, double>{};
    for (int i = 0; i < choices.length; i++) {
      double total = 0;
      for (final item in items) {
        total += item.getWeightedScore(i);
      }
      totals[i] = total;
    }

    setState(() {
      _items = items;
      _choices = choices;
      _totals = totals;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // 가장 높은 점수를 받은 선택지 찾기
    int winnerIndex = 0;
    double maxScore = _totals[0] ?? 0;
    for (int i = 1; i < _choices.length; i++) {
      if ((_totals[i] ?? 0) > maxScore) {
        maxScore = _totals[i] ?? 0;
        winnerIndex = i;
      }
    }

    // 동점인지 확인
    final isTie =
        _totals.values.where((score) => (score - maxScore).abs() < 0.1).length >
        1;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          // 고민 상세 페이지로 바로 이동
          context.go('/concern/${widget.concernId}');
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('분석 결과')),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.paddingLarge,
            AppSpacing.paddingLarge,
            AppSpacing.paddingLarge,
            AppSpacing.paddingXLarge * 2,
          ),
          children: [
            // 결과 요약
            Card(
              margin: EdgeInsets.zero,
              color: AppColors.primary.withValues(alpha: 0.05),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.paddingLarge),
                child: Column(
                  children: [
                    Icon(
                      isTie ? LucideIcons.scale : LucideIcons.sparkles,
                      size: 64,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: AppSpacing.paddingMedium),
                    Text(
                      isTie ? '동점입니다!' : '추천 선택',
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.paddingSmall),
                    Text(
                      isTie ? '여러 선택지가 비슷한 점수를 받았습니다' : _choices[winnerIndex],
                      style: AppTextStyles.headline2.copyWith(
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.paddingXLarge),

            // 총점 비교 막대 차트
            Text('총점 비교', style: AppTextStyles.headline4),
            const SizedBox(height: AppSpacing.paddingMedium),
            Container(
              margin: const EdgeInsets.only(bottom: 0),
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.paddingLarge),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY:
                                _totals.values.reduce((a, b) => a > b ? a : b) *
                                1.2,
                            barTouchData: BarTouchData(enabled: false),
                            titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            gridData: FlGridData(show: false),
                            barGroups: List.generate(_choices.length, (index) {
                              final colors = [
                                AppColors.primary, // A: 파란색
                                const Color(0xFF20B2AA), // B: 청록색 (더 진한 청록색)
                                Colors.orange, // C: 주황색
                                Colors.purple, // D: 보라색
                              ];
                              final isWinner = index == winnerIndex && !isTie;
                              final barColor = colors[index % colors.length];

                              return BarChartGroupData(
                                x: index,
                                barRods: [
                                  BarChartRodData(
                                    toY: _totals[index] ?? 0,
                                    color: barColor,
                                    width: 40,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.paddingMedium),
                      ...List.generate(_choices.length, (index) {
                        final colors = [
                          AppColors.primary, // A: 파란색
                          const Color(0xFF20B2AA), // B: 청록색 (더 진한 청록색)
                          Colors.orange, // C: 주황색
                          Colors.purple, // D: 보라색
                        ];
                        final labels = ['A', 'B', 'C', 'D'];
                        final isWinner = index == winnerIndex && !isTie;

                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppSpacing.paddingSmall,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: colors[index % colors.length],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    labels[index],
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppColors.grey00,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSpacing.paddingMedium),
                              Expanded(
                                child: Text(
                                  _choices[index],
                                  style: AppTextStyles.bodyMedium,
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              const SizedBox(width: 8), // 8px 간격
                              Text(
                                '${(_totals[index] ?? 0).toInt()}점',
                                style: AppTextStyles.labelLarge.copyWith(
                                  color: isWinner
                                      ? AppColors.primary
                                      : AppColors.textSecondary,
                                  fontWeight: isWinner
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: AppSpacing.paddingMedium),
                      // Pie 차트 추가
                      SizedBox(
                        height: 200,
                        child: PieChart(
                          PieChartData(
                            sections: List.generate(_choices.length, (index) {
                              final colors = [
                                AppColors.primary,
                                const Color(0xFF20B2AA),
                                Colors.orange,
                                Colors.purple,
                              ];
                              final total = _totals.values.reduce(
                                (a, b) => a + b,
                              );
                              final percentage = total > 0
                                  ? (_totals[index] ?? 0) / total
                                  : 0;

                              return PieChartSectionData(
                                color: colors[index % colors.length],
                                value: percentage * 100,
                                title:
                                    '${(percentage * 100).toStringAsFixed(1)}%',
                                radius: 60,
                                titleStyle: AppTextStyles.caption.copyWith(
                                  color: AppColors.grey00,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }),
                            sectionsSpace: 2,
                            centerSpaceRadius: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.paddingXLarge),

            // 상세 분석
            Text('상세 분석', style: AppTextStyles.headline4),
            const SizedBox(height: AppSpacing.paddingMedium),
            ..._items.map(
              (item) => Card(
                margin: const EdgeInsets.only(bottom: AppSpacing.paddingMedium),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.paddingLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name, style: AppTextStyles.labelLarge),
                      const SizedBox(height: AppSpacing.paddingMedium),
                      ...List.generate(_choices.length, (index) {
                        final colors = [
                          AppColors.primary,
                          Colors.teal,
                          Colors.orange,
                          Colors.purple,
                        ];
                        final labels = ['A', 'B', 'C', 'D'];
                        final score = item.getWeightedScore(index);
                        final isWinner = index == winnerIndex && !isTie;

                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppSpacing.paddingSmall,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: colors[index % colors.length],
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    labels[index],
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppColors.grey00,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: AppSpacing.paddingMedium),
                              Expanded(
                                child: Text(
                                  _choices[index],
                                  style: AppTextStyles.bodyMedium,
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              const SizedBox(width: 8), // 8px 간격
                              Text(
                                '${score.toInt()}점',
                                style: AppTextStyles.labelLarge.copyWith(
                                  color: isWinner
                                      ? AppColors.primary
                                      : AppColors.textSecondary,
                                  fontWeight: isWinner
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
