import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../models/concern.dart';
import 'package:intl/intl.dart';

class ConcernCard extends StatelessWidget {
  final Concern concern;
  final VoidCallback onTap;

  const ConcernCard({super.key, required this.concern, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy.MM.dd');

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.paddingMedium),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _buildStatusBadge(),
                  const SizedBox(width: AppSpacing.paddingSmall),
                  Expanded(
                    child: Text(
                      concern.title,
                      style: AppTextStyles.labelLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.paddingSmall),
              Text(
                concern.description,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.paddingMedium),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 14,
                    color: AppColors.textTertiary,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    dateFormat.format(concern.createdAt),
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                  const Spacer(),
                  if (concern.logicalFrameworkId != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.paddingSmall,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusSmall,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.analytics,
                            size: 12,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            '논리',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (concern.intuitiveAdviceId != null)
                    Container(
                      margin: const EdgeInsets.only(
                        left: AppSpacing.paddingSmall,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.paddingSmall,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.mystical.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusSmall,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            size: 12,
                            color: AppColors.mystical,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            '직관',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.mystical,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color color;
    String label;

    switch (concern.statusEnum) {
      case ConcernStatus.active:
        color = AppColors.info;
        label = '진행중';
        break;
      case ConcernStatus.resolved:
        color = AppColors.success;
        label = '해결';
        break;
      case ConcernStatus.archived:
        color = AppColors.grey50;
        label = '보관';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.paddingSmall,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
