import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../models/concern.dart';
import 'package:intl/intl.dart';
import '../../../l10n/app_localizations.dart';

class ConcernCard extends StatelessWidget {
  final Concern concern;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const ConcernCard({
    super.key,
    required this.concern,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                  _buildStatusBadge(l10n),
                  const SizedBox(width: AppSpacing.paddingSmall),
                  Expanded(
                    child: Text(
                      concern.title,
                      style: AppTextStyles.labelLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (onDelete != null) ...[
                    const SizedBox(width: AppSpacing.paddingSmall),
                    IconButton(
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete_outline,
                        color: AppColors.error,
                        size: 18,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 24,
                        minHeight: 24,
                      ),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
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
              if (concern.statusEnum == ConcernStatus.resolved &&
                  concern.selectedChoiceIndex != null &&
                  concern.selectedChoiceIndex! < concern.choices.length) ...[
                const SizedBox(height: AppSpacing.paddingMedium),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.paddingSmall),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0EAE14).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
                    border: Border.all(
                      color: const Color(0xFF0EAE14).withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 16,
                        color: const Color(0xFF0EAE14),
                      ),
                      const SizedBox(width: AppSpacing.paddingSmall),
                      Expanded(
                        child: Text(
                          '${l10n.selectedChoice}: ${['A', 'B', 'C', 'D'][concern.selectedChoiceIndex!]} - ${concern.choices[concern.selectedChoiceIndex!]}',
                          style: AppTextStyles.caption.copyWith(
                            color: const Color(0xFF0EAE14),
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                            l10n.logicalAnalysis,
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
                            l10n.intuitiveAnalysis,
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

  Widget _buildStatusBadge(AppLocalizations l10n) {
    Color color;
    String label;

    switch (concern.statusEnum) {
      case ConcernStatus.active:
        color = AppColors.info;
        label = l10n.statusInProgress;
        break;
      case ConcernStatus.resolved:
        color = const Color(0xFF0EAE14);
        label = l10n.statusResolved;
        break;
      case ConcernStatus.archived:
        color = AppColors.grey50;
        label = l10n.statusArchived;
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
