import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/primary_button.dart';
import '../providers/logical_framework_provider.dart';
import '../models/comparison_item.dart';
import '../../concern/providers/concern_provider.dart';

class ScoringScreen extends ConsumerStatefulWidget {
  final String concernId;

  const ScoringScreen({super.key, required this.concernId});

  @override
  ConsumerState<ScoringScreen> createState() => _ScoringScreenState();
}

class _ScoringScreenState extends ConsumerState<ScoringScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<ComparisonItem> _items = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadItems();
  }

  Future<void> _loadItems() async {
    final items = await ref
        .read(logicalFrameworkProvider(widget.concernId).notifier)
        .getComparisonItems();
    setState(() {
      _items = items;
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _updateItem(ComparisonItem item) async {
    await ref
        .read(logicalFrameworkProvider(widget.concernId).notifier)
        .updateComparisonItem(item);
  }

  @override
  Widget build(BuildContext context) {
    final frameworkAsync = ref.watch(
      logicalFrameworkProvider(widget.concernId),
    );
    final concernsAsync = ref.watch(concernListProvider);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          // 고민 상세 페이지로 바로 이동
          context.go('/concern/${widget.concernId}');
        }
      },
      child: frameworkAsync.when(
        data: (framework) {
          if (framework == null) {
            return const Scaffold(
              body: Center(child: Text('프레임워크를 찾을 수 없습니다')),
            );
          }

          return concernsAsync.when(
            data: (concerns) {
              final concern = concerns.firstWhere(
                (c) => c.id == widget.concernId,
              );
              final choices = concern.choices;

              if (choices.isEmpty) {
                return Scaffold(body: Center(child: Text('선택지가 없습니다')));
              }

              return Scaffold(
                appBar: AppBar(
                  title: const Text('점수 매기기'),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.paddingLarge,
                      ),
                      child: TabBar(
                        controller: _tabController,
                        labelStyle: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        unselectedLabelStyle: AppTextStyles.bodyMedium,
                        indicatorWeight: 3.0,
                        indicatorColor: AppColors.primary,
                        unselectedLabelColor: AppColors.grey60,
                        dividerColor: AppColors.grey00,
                        indicatorSize: TabBarIndicatorSize.tab,
                        isScrollable: false,
                        tabAlignment: TabAlignment.fill,
                        indicatorPadding: EdgeInsets.zero,
                        tabs: [
                          Tab(text: '가중치 설정'),
                          Tab(text: '점수 매기기'),
                        ],
                      ),
                    ),
                  ),
                ),
                body: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : TabBarView(
                        controller: _tabController,
                        children: [
                          _buildWeightTab(choices),
                          _buildScoringTab(choices),
                        ],
                      ),
                bottomNavigationBar: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.paddingLarge,
                      AppSpacing.paddingLarge,
                      AppSpacing.paddingLarge,
                      AppSpacing.paddingXLarge,
                    ),
                    child: PrimaryButton(
                      text: '결과 보기',
                      onPressed: () {
                        context.push('/concern/${widget.concernId}/result');
                      },
                    ),
                  ),
                ),
              );
            },
            loading: () => const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) =>
                Scaffold(body: Center(child: Text('오류: $error'))),
          );
        },
        loading: () =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error, stack) =>
            Scaffold(body: Center(child: Text('오류: $error'))),
      ),
    );
  }

  Widget _buildWeightTab(List<String> choices) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.paddingLarge,
        AppSpacing.paddingLarge,
        AppSpacing.paddingLarge,
        AppSpacing.paddingXLarge,
      ),
      children: [
        Text('가중치 설정', style: AppTextStyles.headline3),
        const SizedBox(height: AppSpacing.paddingSmall),
        Text(
          '각 항목의 중요도를 1-10 사이로 설정해주세요',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.paddingXLarge),
        ..._items.map(
          (item) => Card(
            margin: const EdgeInsets.only(bottom: AppSpacing.paddingMedium),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.paddingLarge,
                AppSpacing.paddingLarge,
                AppSpacing.paddingLarge,
                AppSpacing.paddingXLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.name, style: AppTextStyles.labelLarge),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.paddingMedium,
                          vertical: AppSpacing.paddingSmall,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusSmall,
                          ),
                        ),
                        child: Text(
                          item.weight.toStringAsFixed(0),
                          style: AppTextStyles.labelLarge.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.paddingMedium),
                  Slider(
                    value: item.weight.clamp(1.0, 10.0),
                    min: 1,
                    max: 10,
                    divisions: 9,
                    onChanged: (value) {
                      setState(() {
                        final index = _items.indexOf(item);
                        _items[index] = item.copyWith(weight: value);
                      });
                    },
                    onChangeEnd: (value) async {
                      final index = _items.indexOf(item);
                      await _updateItem(_items[index]);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '낮음',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                      Text(
                        '높음',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScoringTab(List<String> choices) {
    final labels = ['A', 'B', 'C', 'D'];
    final colors = [
      AppColors.primary,
      Colors.teal,
      Colors.orange,
      Colors.purple,
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.paddingLarge,
        AppSpacing.paddingLarge,
        AppSpacing.paddingLarge,
        AppSpacing.paddingXLarge,
      ),
      children: [
        Text('점수 매기기', style: AppTextStyles.headline3),
        const SizedBox(height: AppSpacing.paddingSmall),
        Text(
          '각 항목별로 선택지의 점수를 매겨주세요 (1-10)',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.paddingXLarge),
        ..._items.map((item) {
          // 점수가 가장 높은 인덱스 찾기
          int maxIndex = 0;
          double maxScore = item.getScore(0);
          for (int i = 1; i < choices.length; i++) {
            if (item.getScore(i) > maxScore) {
              maxScore = item.getScore(i);
              maxIndex = i;
            }
          }

          return Card(
            margin: const EdgeInsets.only(bottom: AppSpacing.paddingLarge),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.paddingLarge,
                AppSpacing.paddingLarge,
                AppSpacing.paddingLarge,
                AppSpacing.paddingXLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.paddingSmall,
                          vertical: AppSpacing.xs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.grey50.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusSmall,
                          ),
                        ),
                        child: Text(
                          '가중치 ${item.weight.toStringAsFixed(0)}',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.paddingSmall),
                      Expanded(
                        child: Text(item.name, style: AppTextStyles.labelLarge),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.paddingLarge),
                  ...List.generate(choices.length, (index) {
                    final isMaxScore =
                        index == maxIndex && item.getScore(index) > 0;
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index < choices.length - 1
                            ? AppSpacing.paddingMedium
                            : 0,
                      ),
                      child: _buildScoreRow(
                        label: '${labels[index]}. ${choices[index]}',
                        score: item.getScore(index),
                        color: isMaxScore ? colors[index] : AppColors.grey70,
                        onChanged: (value) {
                          setState(() {
                            final itemIndex = _items.indexOf(item);
                            _items[itemIndex].setScore(index, value);
                            _items[itemIndex] =
                                _items[itemIndex]; // trigger update
                          });
                        },
                        onChangeEnd: (value) async {
                          final itemIndex = _items.indexOf(item);
                          _items[itemIndex].setScore(index, value);
                          await _updateItem(_items[itemIndex]);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildScoreRow({
    required String label,
    required double score,
    required Color color,
    required ValueChanged<double> onChanged,
    required ValueChanged<double> onChangeEnd,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.labelMedium.copyWith(color: color),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: AppSpacing.paddingSmall),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.paddingMedium,
                vertical: AppSpacing.paddingSmall,
              ),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
              ),
              child: Text(
                score.toStringAsFixed(0),
                style: AppTextStyles.labelMedium.copyWith(color: color),
              ),
            ),
          ],
        ),
        Slider(
          value: score.clamp(1.0, 10.0),
          min: 1,
          max: 10,
          divisions: 9,
          activeColor: color,
          onChanged: onChanged,
          onChangeEnd: onChangeEnd,
        ),
      ],
    );
  }
}
