import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/primary_button.dart';
import '../providers/logical_framework_provider.dart';
import '../models/comparison_item.dart';

class ComparisonSetupScreen extends ConsumerStatefulWidget {
  final String concernId;

  const ComparisonSetupScreen({super.key, required this.concernId});

  @override
  ConsumerState<ComparisonSetupScreen> createState() =>
      _ComparisonSetupScreenState();
}

class _ComparisonSetupScreenState extends ConsumerState<ComparisonSetupScreen> {
  final List<String> _predefinedItems = [
    '연봉',
    '워라밸',
    '성장 가능성',
    '조직 문화',
    '복지',
    '출퇴근 거리',
    '업무 내용',
    '직급/직책',
  ];

  Future<void> _addItem(String name) async {
    await ref
        .read(logicalFrameworkProvider(widget.concernId).notifier)
        .addComparisonItem(name: name, weight: 5.0);
  }

  Future<void> _showCustomItemDialog() async {
    final controller = TextEditingController();

    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('비교 항목 추가'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: '비교 항목 이름을 입력하세요'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                Navigator.pop(context, controller.text.trim());
              }
            },
            child: const Text('추가'),
          ),
        ],
      ),
    );

    if (result != null) {
      await _addItem(result);
      setState(() {});
    }
  }

  Future<List<ComparisonItem>> _getItems() async {
    return await ref
        .read(logicalFrameworkProvider(widget.concernId).notifier)
        .getComparisonItems();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          // 고민 상세 페이지로 바로 이동
          context.go('/concern/${widget.concernId}');
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('비교 항목 설정')),
        body: FutureBuilder<List<ComparisonItem>>(
          future: _getItems(),
          builder: (context, snapshot) {
            final items = snapshot.data ?? [];

            return ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.paddingLarge,
                AppSpacing.paddingLarge,
                AppSpacing.paddingLarge,
                AppSpacing.paddingXLarge * 2,
              ),
              children: [
                Text('비교할 항목을 선택하세요', style: AppTextStyles.headline3),
                const SizedBox(height: AppSpacing.paddingSmall),
                Text(
                  '중요하게 생각하는 가치관을 선택해주세요',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.paddingXLarge),
                OutlinedButton.icon(
                  onPressed: _showCustomItemDialog,
                  icon: const Icon(Icons.add),
                  label: const Text('직접 입력'),
                ),
                const SizedBox(height: AppSpacing.paddingLarge),
                Text('추천 항목', style: AppTextStyles.labelLarge),
                const SizedBox(height: AppSpacing.paddingMedium),
                Wrap(
                  spacing: AppSpacing.paddingSmall,
                  runSpacing: AppSpacing.paddingSmall,
                  children: _predefinedItems.map((item) {
                    final isSelected = items.any((i) => i.name == item);
                    return FilterChip(
                      label: Text(item),
                      selected: isSelected,
                      onSelected: (selected) async {
                        if (selected) {
                          await _addItem(item);
                        } else {
                          final existingItem = items.firstWhere(
                            (i) => i.name == item,
                          );
                          await ref
                              .read(
                                logicalFrameworkProvider(
                                  widget.concernId,
                                ).notifier,
                              )
                              .deleteComparisonItem(existingItem.id);
                        }
                        setState(() {});
                      },
                      selectedColor: AppColors.primary,
                      checkmarkColor: AppColors.grey00,
                      side: BorderSide(color: AppColors.grey60),
                    );
                  }).toList(),
                ),
                if (items.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.paddingLarge),
                  Text(
                    '선택된 항목',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.paddingMedium),
                  ...items.map(
                    (item) => Card(
                      margin: const EdgeInsets.only(
                        bottom: AppSpacing.paddingSmall,
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.check_circle,
                          color: AppColors.primary,
                        ),
                        title: Text(item.name),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_outline,
                            color: AppColors.error,
                          ),
                          onPressed: () async {
                            await ref
                                .read(
                                  logicalFrameworkProvider(
                                    widget.concernId,
                                  ).notifier,
                                )
                                .deleteComparisonItem(item.id);
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: AppSpacing.paddingXLarge),
                PrimaryButton(
                  text: '다음',
                  onPressed: items.isEmpty
                      ? null
                      : () {
                          context.push('/concern/${widget.concernId}/scoring');
                        },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
