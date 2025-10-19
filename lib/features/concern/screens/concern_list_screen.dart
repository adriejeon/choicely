import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/animations/fade_in_transition.dart';
import '../../../core/widgets/language_selector.dart';
import '../../../core/widgets/ad_banner_widget.dart';
import '../providers/concern_provider.dart';
import '../widgets/concern_card.dart';
import '../../../l10n/app_localizations.dart';

class ConcernListScreen extends ConsumerWidget {
  const ConcernListScreen({super.key});

  Future<void> _showDeleteDialog(
    BuildContext context,
    WidgetRef ref,
    concern,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteConcern),
        content: Text(l10n.deleteConcernMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(concernListProvider.notifier).deleteConcern(concern.id);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final concernsAsync = ref.watch(concernListProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.concernList),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/ad-example');
            },
            icon: const Icon(Icons.ads_click),
            tooltip: 'AdMob 예시',
          ),
          const LanguageSelector(),
        ],
      ),
      body: Column(
        children: [
          // 상단 배너 광고
          const AdBannerWidget(),

          // 메인 콘텐츠
          Expanded(
            child: concernsAsync.when(
              data: (concerns) {
                if (concerns.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lightbulb_outline,
                          size: 80,
                          color: AppColors.grey40,
                        ),
                        const SizedBox(height: AppSpacing.paddingLarge),
                        Text(
                          l10n.noConcerns,
                          style: AppTextStyles.headline4.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.paddingSmall),
                        Text(
                          l10n.addNewConcern,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.paddingMedium,
                    AppSpacing.paddingMedium,
                    AppSpacing.paddingMedium,
                    AppSpacing.paddingXLarge * 4,
                  ),
                  itemCount: concerns.length,
                  itemBuilder: (context, index) {
                    final concern = concerns[index];
                    return SlideInTransition(
                      delay: Duration(milliseconds: index * 50),
                      child: ConcernCard(
                        concern: concern,
                        onTap: () {
                          context.push('/concern/${concern.id}');
                        },
                        onDelete: () =>
                            _showDeleteDialog(context, ref, concern),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Text('${l10n.errorOccurred}: ${error.toString()}'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/template-selection');
        },
        icon: const Icon(Icons.add),
        label: Text(l10n.addConcernButton),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.grey00,
        elevation: 0,
      ),
    );
  }
}
