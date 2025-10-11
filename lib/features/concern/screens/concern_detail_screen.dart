import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/language_selector.dart';
import '../providers/concern_provider.dart';
import '../providers/analysis_result_provider.dart';
import '../models/concern.dart';
import 'package:intl/intl.dart';
import '../../../l10n/app_localizations.dart';

class ConcernDetailScreen extends ConsumerStatefulWidget {
  final String concernId;

  const ConcernDetailScreen({super.key, required this.concernId});

  @override
  ConsumerState<ConcernDetailScreen> createState() =>
      _ConcernDetailScreenState();
}

class _ConcernDetailScreenState extends ConsumerState<ConcernDetailScreen> {
  int? _selectedChoiceIndex; // 선택된 선택지 인덱스
  bool _hasRefreshed = false; // 분석 결과 새로고침 여부

  @override
  void initState() {
    super.initState();
    // 페이지 로드 시 분석 결과 새로고침
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(analysisResultProvider.notifier).refreshResults();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 의존성이 변경될 때마다 분석 결과 새로고침 (한 번만)
    if (!_hasRefreshed) {
      _hasRefreshed = true;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await ref.read(analysisResultProvider.notifier).refreshResults();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final concernsAsync = ref.watch(concernListProvider);
    final analysisResults = ref.watch(analysisResultProvider);

    return concernsAsync.when(
      data: (concerns) {
        final concern = concerns.firstWhere((c) => c.id == widget.concernId);
        final dateFormat = DateFormat('yyyy년 MM월 dd일');

        // 분석 결과 가져오기

        final logicalResult = analysisResults
            .where(
              (result) =>
                  result.concernId == widget.concernId &&
                  result.type == 'logical',
            )
            .firstOrNull;

        // 논리 분석 상태 확인
        bool isLogicalCompleted = false;
        bool isLogicalInProgress = false;
        if (logicalResult != null) {
          try {
            final data = logicalResult.data;
            isLogicalCompleted = data['isCompleted'] == true;
            // 논리 분석이 시작되었지만 완료되지 않은 경우 (items가 있지만 isCompleted가 false)
            isLogicalInProgress = !isLogicalCompleted && data['items'] != null;
          } catch (e) {
            print('❌ [DETAIL] Error checking logical completion: $e');
            isLogicalCompleted = false;
            isLogicalInProgress = false;
          }
        }
        final intuitiveResult = analysisResults
            .where(
              (result) =>
                  result.concernId == widget.concernId &&
                  result.type == 'intuitive',
            )
            .firstOrNull;

        // 직관 분석 상태 확인
        bool isIntuitiveCompleted = false;
        bool isIntuitiveInProgress = false;
        if (intuitiveResult != null) {
          try {
            final data = intuitiveResult.data;
            isIntuitiveCompleted = data['isCompleted'] == true;
            isIntuitiveInProgress =
                !isIntuitiveCompleted && data['selectedCards'] != null;
          } catch (e) {
            print('❌ [DETAIL] Error checking intuitive completion: $e');
            isIntuitiveCompleted = false;
            isIntuitiveInProgress = false;
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.concernDetail),
            actions: const [LanguageSelector()],
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // 홈으로 이동
                context.go('/');
              },
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.paddingLarge,
              AppSpacing.paddingLarge,
              AppSpacing.paddingLarge,
              AppSpacing.paddingXLarge * 2,
            ),
            children: [
              Column(
                children: [
                  Text(concern.title, style: AppTextStyles.headline2),
                  const SizedBox(height: AppSpacing.paddingMedium),
                  Text(
                    dateFormat.format(concern.createdAt),
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.paddingMedium),
              Container(
                padding: const EdgeInsets.all(AppSpacing.paddingLarge),
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                ),
                child: Text(
                  concern.description,
                  style: AppTextStyles.bodyMedium,
                ),
              ),
              const SizedBox(height: AppSpacing.paddingLarge),
              SectionHeader(title: l10n.analysisMethodSelection),
              _buildAnalysisCard(
                context: context,
                title: l10n.logicalAnalysisTitle,
                subtitle: l10n.logicalAnalysisSubtitle,
                icon: Icons.analytics,
                color: AppColors.primary,
                hasResult: isLogicalCompleted,
                resultPreview: isLogicalCompleted
                    ? _buildLogicalResultPreview(logicalResult, l10n)
                    : null,
                badgeText: isLogicalInProgress
                    ? l10n.statusInProgress
                    : (isLogicalCompleted ? null : l10n.scheduled),
                badgeColor: isLogicalInProgress
                    ? AppColors.primary.withValues(alpha: 0.1)
                    : (isLogicalCompleted ? null : AppColors.grey10),
                badgeTextColor: isLogicalInProgress
                    ? AppColors.primary
                    : (isLogicalCompleted ? null : AppColors.grey60),
                onTap: () {
                  context.push(
                    '/concern/${widget.concernId}/logical-framework',
                  );
                },
                l10n: l10n,
              ),
              const SizedBox(height: 16),
              _buildAnalysisCard(
                context: context,
                title: l10n.intuitiveAnalysisTitle,
                subtitle: l10n.intuitiveAnalysisSubtitle,
                icon: Icons.auto_awesome,
                color: AppColors.mystical,
                hasResult: isIntuitiveCompleted,
                resultPreview: isIntuitiveCompleted
                    ? _buildIntuitiveResultPreview(intuitiveResult, l10n)
                    : null,
                badgeText: isIntuitiveInProgress
                    ? l10n.statusInProgress
                    : (isIntuitiveCompleted ? null : l10n.scheduled),
                badgeColor: isIntuitiveInProgress
                    ? AppColors.mystical.withValues(alpha: 0.1)
                    : (isIntuitiveCompleted ? null : AppColors.grey10),
                badgeTextColor: isIntuitiveInProgress
                    ? AppColors.mystical
                    : (isIntuitiveCompleted ? null : AppColors.grey60),
                onTap: () {
                  context.push('/concern/${widget.concernId}/tarot');
                },
                l10n: l10n,
              ),
              if (concern.choices.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.paddingLarge),
                SectionHeader(title: l10n.finalChoiceSelection),
                ..._buildChoicesList(concern.choices, concern),
                // 완료되지 않은 고민에 대해서만 최종 결정하기 버튼 표시
                if (concern.statusEnum != ConcernStatus.resolved) ...[
                  const SizedBox(height: AppSpacing.paddingLarge),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _selectedChoiceIndex != null
                          ? () => _onFinalDecision(l10n)
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedChoiceIndex != null
                            ? AppColors.primary
                            : AppColors.grey40,
                        foregroundColor: AppColors.grey00,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusMedium,
                          ),
                        ),
                      ),
                      child: Text(
                        l10n.makeFinalDecision,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ],
          ),
        );
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) =>
          Scaffold(body: Center(child: Text('${l10n.errorOccurred}: $error'))),
    );
  }

  Widget _buildAnalysisCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    bool hasResult = false,
    Widget? resultPreview,
    required AppLocalizations l10n,
    String? badgeText,
    Color? badgeColor,
    Color? badgeTextColor,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.paddingMedium),
            child: Column(
              children: [
                // 아이콘, 텍스트, 화살표 영역
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.paddingMedium),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusMedium,
                        ),
                      ),
                      child: Icon(icon, size: 32, color: color),
                    ),
                    const SizedBox(width: AppSpacing.paddingLarge),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  style: AppTextStyles.labelLarge.copyWith(
                                    color: color,
                                  ),
                                ),
                              ),
                              if (hasResult)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.paddingSmall,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: color.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(
                                      AppSpacing.radiusSmall,
                                    ),
                                  ),
                                  child: Text(
                                    l10n.completed,
                                    style: AppTextStyles.caption.copyWith(
                                      color: color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              else if (badgeText != null)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.paddingSmall,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: badgeColor ?? AppColors.grey10,
                                    borderRadius: BorderRadius.circular(
                                      AppSpacing.radiusSmall,
                                    ),
                                  ),
                                  child: Text(
                                    badgeText,
                                    style: AppTextStyles.caption.copyWith(
                                      color: badgeTextColor ?? AppColors.grey60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            subtitle,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: AppColors.textTertiary),
                  ],
                ),
                // 결과 미리보기 영역 (전체 너비)
                if (resultPreview != null) ...[
                  const SizedBox(height: AppSpacing.paddingMedium),
                  resultPreview,
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogicalResultPreview(
    dynamic logicalResult,
    AppLocalizations l10n,
  ) {
    try {
      final data = logicalResult.data as Map<String, dynamic>;
      final winnerChoice = data['winnerChoice'] as String? ?? '';
      final maxScore = (data['maxScore'] as num?)?.toDouble() ?? 0.0;
      final winnerIndex = (data['winnerIndex'] as num?)?.toInt() ?? 0;

      return Container(
        padding: const EdgeInsets.all(AppSpacing.paddingSmall),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.emoji_events, size: 16, color: AppColors.primary),
                const SizedBox(width: AppSpacing.paddingSmall),
                Text(
                  l10n.recommendedChoice,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '${l10n.choiceLabel(winnerIndex)}: $winnerChoice',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              '${l10n.score}: ${maxScore.toInt()}',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      );
    } catch (e) {
      print('❌ [LOGICAL_PREVIEW] Error building logical result preview: $e');
      return Container(
        padding: const EdgeInsets.all(AppSpacing.paddingSmall),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
        ),
        child: Text(
          '논리 분석 결과를 불러올 수 없습니다.',
          style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
        ),
      );
    }
  }

  Map<String, String> _getOracleCardInfo(
    int cardNumber,
    AppLocalizations l10n,
  ) {
    // 오라클 카드별 정보 (1-35번) - 타로 화면과 동일한 로직
    final cardInfo = {
      1: {
        'name': l10n.oracleCard1Name,
        'text': l10n.oracleCard1Text,
        'percentage': l10n.oracleCard1Percentage,
        'description': l10n.oracleCard1Description,
      },
      2: {
        'name': l10n.oracleCard2Name,
        'text': l10n.oracleCard2Text,
        'percentage': l10n.oracleCard2Percentage,
        'description': l10n.oracleCard2Description,
      },
      3: {
        'name': l10n.oracleCard3Name,
        'text': l10n.oracleCard3Text,
        'percentage': l10n.oracleCard3Percentage,
        'description': l10n.oracleCard3Description,
      },
      4: {
        'name': l10n.oracleCard4Name,
        'text': l10n.oracleCard4Text,
        'percentage': l10n.oracleCard4Percentage,
        'description': l10n.oracleCard4Description,
      },
      5: {
        'name': l10n.oracleCard5Name,
        'text': l10n.oracleCard5Text,
        'percentage': l10n.oracleCard5Percentage,
        'description': l10n.oracleCard5Description,
      },
      6: {
        'name': l10n.oracleCard6Name,
        'text': l10n.oracleCard6Text,
        'percentage': l10n.oracleCard6Percentage,
        'description': l10n.oracleCard6Description,
      },
      7: {
        'name': l10n.oracleCard7Name,
        'text': l10n.oracleCard7Text,
        'percentage': l10n.oracleCard7Percentage,
        'description': l10n.oracleCard7Description,
      },
      8: {
        'name': l10n.oracleCard8Name,
        'text': l10n.oracleCard8Text,
        'percentage': l10n.oracleCard8Percentage,
        'description': l10n.oracleCard8Description,
      },
      9: {
        'name': l10n.oracleCard9Name,
        'text': l10n.oracleCard9Text,
        'percentage': l10n.oracleCard9Percentage,
        'description': l10n.oracleCard9Description,
      },
      10: {
        'name': l10n.oracleCard10Name,
        'text': l10n.oracleCard10Text,
        'percentage': l10n.oracleCard10Percentage,
        'description': l10n.oracleCard10Description,
      },
      11: {
        'name': l10n.oracleCard11Name,
        'text': l10n.oracleCard11Text,
        'percentage': l10n.oracleCard11Percentage,
        'description': l10n.oracleCard11Description,
      },
      12: {
        'name': l10n.oracleCard12Name,
        'text': l10n.oracleCard12Text,
        'percentage': l10n.oracleCard12Percentage,
        'description': l10n.oracleCard12Description,
      },
      13: {
        'name': l10n.oracleCard13Name,
        'text': l10n.oracleCard13Text,
        'percentage': l10n.oracleCard13Percentage,
        'description': l10n.oracleCard13Description,
      },
      14: {
        'name': l10n.oracleCard14Name,
        'text': l10n.oracleCard14Text,
        'percentage': l10n.oracleCard14Percentage,
        'description': l10n.oracleCard14Description,
      },
      15: {
        'name': l10n.oracleCard15Name,
        'text': l10n.oracleCard15Text,
        'percentage': l10n.oracleCard15Percentage,
        'description': l10n.oracleCard15Description,
      },
      16: {
        'name': l10n.oracleCard16Name,
        'text': l10n.oracleCard16Text,
        'percentage': l10n.oracleCard16Percentage,
        'description': l10n.oracleCard16Description,
      },
      17: {
        'name': l10n.oracleCard17Name,
        'text': l10n.oracleCard17Text,
        'percentage': l10n.oracleCard17Percentage,
        'description': l10n.oracleCard17Description,
      },
      18: {
        'name': l10n.oracleCard18Name,
        'text': l10n.oracleCard18Text,
        'percentage': l10n.oracleCard18Percentage,
        'description': l10n.oracleCard18Description,
      },
      19: {
        'name': l10n.oracleCard19Name,
        'text': l10n.oracleCard19Text,
        'percentage': l10n.oracleCard19Percentage,
        'description': l10n.oracleCard19Description,
      },
      20: {
        'name': l10n.oracleCard20Name,
        'text': l10n.oracleCard20Text,
        'percentage': l10n.oracleCard20Percentage,
        'description': l10n.oracleCard20Description,
      },
      21: {
        'name': l10n.oracleCard21Name,
        'text': l10n.oracleCard21Text,
        'percentage': l10n.oracleCard21Percentage,
        'description': l10n.oracleCard21Description,
      },
      22: {
        'name': l10n.oracleCard22Name,
        'text': l10n.oracleCard22Text,
        'percentage': l10n.oracleCard22Percentage,
        'description': l10n.oracleCard22Description,
      },
      23: {
        'name': l10n.oracleCard23Name,
        'text': l10n.oracleCard23Text,
        'percentage': l10n.oracleCard23Percentage,
        'description': l10n.oracleCard23Description,
      },
      24: {
        'name': l10n.oracleCard24Name,
        'text': l10n.oracleCard24Text,
        'percentage': l10n.oracleCard24Percentage,
        'description': l10n.oracleCard24Description,
      },
      25: {
        'name': l10n.oracleCard25Name,
        'text': l10n.oracleCard25Text,
        'percentage': l10n.oracleCard25Percentage,
        'description': l10n.oracleCard25Description,
      },
      26: {
        'name': l10n.oracleCard26Name,
        'text': l10n.oracleCard26Text,
        'percentage': l10n.oracleCard26Percentage,
        'description': l10n.oracleCard26Description,
      },
      27: {
        'name': l10n.oracleCard27Name,
        'text': l10n.oracleCard27Text,
        'percentage': l10n.oracleCard27Percentage,
        'description': l10n.oracleCard27Description,
      },
      28: {
        'name': l10n.oracleCard28Name,
        'text': l10n.oracleCard28Text,
        'percentage': l10n.oracleCard28Percentage,
        'description': l10n.oracleCard28Description,
      },
      29: {
        'name': l10n.oracleCard29Name,
        'text': l10n.oracleCard29Text,
        'percentage': l10n.oracleCard29Percentage,
        'description': l10n.oracleCard29Description,
      },
      30: {
        'name': l10n.oracleCard30Name,
        'text': l10n.oracleCard30Text,
        'percentage': l10n.oracleCard30Percentage,
        'description': l10n.oracleCard30Description,
      },
      31: {
        'name': l10n.oracleCard31Name,
        'text': l10n.oracleCard31Text,
        'percentage': l10n.oracleCard31Percentage,
        'description': l10n.oracleCard31Description,
      },
      32: {
        'name': l10n.oracleCard32Name,
        'text': l10n.oracleCard32Text,
        'percentage': l10n.oracleCard32Percentage,
        'description': l10n.oracleCard32Description,
      },
      33: {
        'name': l10n.oracleCard33Name,
        'text': l10n.oracleCard33Text,
        'percentage': l10n.oracleCard33Percentage,
        'description': l10n.oracleCard33Description,
      },
      34: {
        'name': l10n.oracleCard34Name,
        'text': l10n.oracleCard34Text,
        'percentage': l10n.oracleCard34Percentage,
        'description': l10n.oracleCard34Description,
      },
      35: {
        'name': l10n.oracleCard35Name,
        'text': l10n.oracleCard35Text,
        'percentage': l10n.oracleCard35Percentage,
        'description': l10n.oracleCard35Description,
      },
    };

    return cardInfo[cardNumber] ??
        {
          'name': l10n.destinyMessage,
          'text': 'YES',
          'percentage': '50%',
          'description': l10n.destinyMessage,
        };
  }

  Widget _buildIntuitiveResultPreview(
    dynamic intuitiveResult,
    AppLocalizations l10n,
  ) {
    try {
      final data = intuitiveResult.data as Map<String, dynamic>;
      final selectedCardsRaw = data['selectedCards'];
      final messagesRaw = data['messages'];
      final selectedChoiceIndex = data['selectedChoiceIndex'] as int?;

      if (selectedCardsRaw == null ||
          messagesRaw == null ||
          selectedChoiceIndex == null) {
        return const SizedBox.shrink();
      }

      // JSON에서 로드된 데이터를 원래 형태로 변환
      final selectedCards = Map<int, int>.from(
        (selectedCardsRaw as Map<String, dynamic>).map(
          (key, value) => MapEntry(int.parse(key), int.parse(value.toString())),
        ),
      );

      if (selectedCards.isEmpty) {
        return const SizedBox.shrink();
      }

      // 선택된 선택지의 결과를 표시
      final cardNumber = selectedCards[selectedChoiceIndex]!;

      // 카드 번호로부터 현재 언어의 카드 정보 가져오기
      final cardInfo = _getOracleCardInfo(cardNumber, l10n);
      final cardName = cardInfo['name'] ?? 'Card $cardNumber';
      final cardDescription = cardInfo['description'] ?? '';

      return Container(
        padding: const EdgeInsets.all(AppSpacing.paddingSmall),
        decoration: BoxDecoration(
          color: AppColors.mystical.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
          border: Border.all(color: AppColors.mystical.withValues(alpha: 0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.auto_awesome, size: 16, color: AppColors.mystical),
                const SizedBox(width: AppSpacing.paddingSmall),
                Text(
                  l10n.tarotCardResult,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.mystical,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              cardName,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (cardDescription.isNotEmpty) ...[
              const SizedBox(height: 2),
              Text(
                cardDescription,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      );
    } catch (e) {
      print(
        '❌ [INTUITIVE_PREVIEW] Error building intuitive result preview: $e',
      );
      return Container(
        padding: const EdgeInsets.all(AppSpacing.paddingSmall),
        decoration: BoxDecoration(
          color: AppColors.mystical.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
          border: Border.all(color: AppColors.mystical.withValues(alpha: 0.2)),
        ),
        child: Text(
          '직관 분석 결과를 불러올 수 없습니다.',
          style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
        ),
      );
    }
  }

  List<Widget> _buildChoicesList(List<String> choices, Concern concern) {
    final labels = ['A', 'B', 'C', 'D'];
    final colors = [
      AppColors.primary,
      Colors.teal,
      Colors.orange,
      Colors.purple,
    ];

    return List.generate(choices.length, (index) {
      // 완료된 고민의 경우 기존 선택된 항목 표시
      final isCompleted = concern.statusEnum == ConcernStatus.resolved;
      final isCompletedSelected =
          isCompleted && concern.selectedChoiceIndex == index;

      // 진행 중인 고민의 경우 현재 선택된 항목 표시
      final isCurrentlySelected = !isCompleted && _selectedChoiceIndex == index;

      return Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.paddingSmall),
        child: isCompleted
            ? Container(
                padding: const EdgeInsets.all(AppSpacing.paddingMedium),
                decoration: BoxDecoration(
                  color: isCompletedSelected
                      ? const Color(0xFF0EAE14).withValues(alpha: 0.15)
                      : colors[index].withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                  border: Border.all(
                    color: isCompletedSelected
                        ? const Color(0xFF0EAE14).withValues(alpha: 0.5)
                        : colors[index].withValues(alpha: 0.2),
                    width: isCompletedSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: isCompletedSelected
                            ? const Color(0xFF0EAE14)
                            : colors[index],
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusSmall,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          labels[index],
                          style: AppTextStyles.labelLarge.copyWith(
                            color: AppColors.grey00,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.paddingMedium),
                    Expanded(
                      child: Text(
                        choices[index],
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: isCompletedSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    if (isCompletedSelected)
                      Icon(
                        Icons.check_circle,
                        color: const Color(0xFF0EAE14),
                        size: 24,
                      ),
                  ],
                ),
              )
            : InkWell(
                onTap: () => _onChoiceTapped(index),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.paddingMedium),
                  decoration: BoxDecoration(
                    color: isCurrentlySelected
                        ? colors[index].withValues(alpha: 0.15)
                        : AppColors.grey10,
                    borderRadius: BorderRadius.circular(
                      AppSpacing.radiusMedium,
                    ),
                    border: isCurrentlySelected
                        ? Border.all(
                            color: colors[index].withValues(alpha: 0.5),
                            width: 2,
                          )
                        : null,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: isCurrentlySelected
                              ? colors[index]
                              : AppColors.grey30,
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusSmall,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            labels[index],
                            style: AppTextStyles.labelLarge.copyWith(
                              color: AppColors.grey00,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.paddingMedium),
                      Expanded(
                        child: Text(
                          choices[index],
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: isCurrentlySelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isCurrentlySelected
                                ? AppColors.textPrimary
                                : AppColors.grey60,
                          ),
                        ),
                      ),
                      Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          value: isCurrentlySelected,
                          onChanged: (value) => _onChoiceTapped(index),
                          activeColor: colors[index],
                          checkColor: AppColors.grey00,
                          fillColor: WidgetStateProperty.resolveWith<Color?>((
                            Set<WidgetState> states,
                          ) {
                            if (states.contains(WidgetState.selected)) {
                              return colors[index];
                            }
                            return null; // 기본 테두리 색상 사용
                          }),
                          side: BorderSide(
                            color: isCurrentlySelected
                                ? colors[index]
                                : AppColors.grey80,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }

  void _onChoiceTapped(int index) {
    setState(() {
      _selectedChoiceIndex = index;
    });
  }

  Future<void> _onFinalDecision(AppLocalizations l10n) async {
    if (_selectedChoiceIndex == null) return;

    final concern = ref
        .read(concernListProvider)
        .value
        ?.firstWhere((c) => c.id == widget.concernId);

    if (concern == null) return;

    final labels = ['A', 'B', 'C', 'D'];
    final selectedChoice = concern.choices[_selectedChoiceIndex!];

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.finalDecisionConfirmation),
        content: Text(
          l10n.finalDecisionMessage(
            labels[_selectedChoiceIndex!],
            selectedChoice,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              l10n.confirm,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      // 고민 완료 처리
      await ref
          .read(concernListProvider.notifier)
          .finalizeConcern(widget.concernId, _selectedChoiceIndex!);

      if (mounted) {
        // 홈 화면으로 이동
        context.go('/');
      }
    }
  }
}
