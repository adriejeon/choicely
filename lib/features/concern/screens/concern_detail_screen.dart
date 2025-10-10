import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/section_header.dart';
import '../providers/concern_provider.dart';
import 'package:intl/intl.dart';

class ConcernDetailScreen extends ConsumerWidget {
  final String concernId;

  const ConcernDetailScreen({super.key, required this.concernId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final concernsAsync = ref.watch(concernListProvider);

    return concernsAsync.when(
      data: (concerns) {
        final concern = concerns.firstWhere((c) => c.id == concernId);
        final dateFormat = DateFormat('yyyy년 MM월 dd일');

        return Scaffold(
          appBar: AppBar(
            title: const Text('고민 상세'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // 홈으로 이동
                context.go('/');
              },
            ),
            actions: [
              PopupMenuButton<String>(
                onSelected: (value) async {
                  if (value == 'delete') {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('고민 삭제'),
                        content: const Text('이 고민을 삭제하시겠습니까?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('취소'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text(
                              '삭제',
                              style: TextStyle(color: AppColors.error),
                            ),
                          ),
                        ],
                      ),
                    );

                    if (confirm == true && context.mounted) {
                      await ref
                          .read(concernListProvider.notifier)
                          .deleteConcern(concernId);
                      if (context.mounted) {
                        context.pop();
                      }
                    }
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: AppColors.error),
                        SizedBox(width: AppSpacing.paddingSmall),
                        Text('삭제'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
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
              if (concern.choices.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.paddingLarge),
                SectionHeader(title: '선택지'),
                ..._buildChoicesList(concern.choices),
              ],
              SectionHeader(title: '분석 방법 선택'),
              _buildAnalysisCard(
                context: context,
                title: '논리 분석',
                subtitle: '가치관을 설정하고 점수를 매겨 객관적으로 비교해보세요',
                icon: Icons.analytics,
                color: AppColors.primary,
                onTap: () {
                  context.push('/concern/$concernId/logical-framework');
                },
              ),
              const SizedBox(height: 16),
              _buildAnalysisCard(
                context: context,
                title: '직관 분석',
                subtitle: '타로카드를 통해 내면의 소리를 들어보세요',
                icon: Icons.auto_awesome,
                color: AppColors.mystical,
                onTap: () {
                  context.push('/concern/$concernId/tarot');
                },
              ),
            ],
          ),
        );
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) =>
          Scaffold(body: Center(child: Text('오류가 발생했습니다: $error'))),
    );
  }

  Widget _buildAnalysisCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
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
            child: Row(
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
                      Text(
                        title,
                        style: AppTextStyles.labelLarge.copyWith(color: color),
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
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChoicesList(List<String> choices) {
    final labels = ['A', 'B', 'C', 'D'];
    final colors = [
      AppColors.primary,
      Colors.teal,
      Colors.orange,
      Colors.purple,
    ];

    return List.generate(
      choices.length,
      (index) => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.paddingSmall),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.paddingMedium),
          decoration: BoxDecoration(
            color: colors[index].withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
            border: Border.all(color: colors[index].withValues(alpha: 0.2)),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: colors[index],
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
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
                child: Text(choices[index], style: AppTextStyles.bodyMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
