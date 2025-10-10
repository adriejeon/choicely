import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/animations/fade_in_transition.dart';
import '../providers/concern_provider.dart';
import '../widgets/concern_card.dart';

class ConcernListScreen extends ConsumerWidget {
  const ConcernListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final concernsAsync = ref.watch(concernListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('나의 고민')),
      body: concernsAsync.when(
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
                    '고민이 없습니다',
                    style: AppTextStyles.headline4.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.paddingSmall),
                  Text(
                    '새로운 고민을 추가해보세요',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.paddingMedium),
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
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('오류가 발생했습니다: $error')),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/add-concern');
        },
        icon: const Icon(Icons.add),
        label: const Text('고민 추가'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.grey00,
        elevation: 0,
      ),
    );
  }
}
