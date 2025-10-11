import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/language_selector.dart';
import '../providers/logical_framework_provider.dart';
import '../models/comparison_item.dart';
import '../../concern/providers/concern_provider.dart';
import '../../concern/providers/analysis_result_provider.dart';
import '../../concern/models/concern_template.dart';
import '../../../l10n/app_localizations.dart';

class ComparisonSetupScreen extends ConsumerStatefulWidget {
  final String concernId;

  const ComparisonSetupScreen({super.key, required this.concernId});

  @override
  ConsumerState<ComparisonSetupScreen> createState() =>
      _ComparisonSetupScreenState();
}

class _ComparisonSetupScreenState extends ConsumerState<ComparisonSetupScreen> {
  List<String> _getTemplateChips(AppLocalizations l10n) {
    final concern = ref
        .read(concernListProvider)
        .value
        ?.firstWhere((c) => c.id == widget.concernId);

    if (concern?.templateId == null) return [];

    final template = ConcernTemplate.templates.firstWhere(
      (t) => t.id == concern!.templateId,
      orElse: () => ConcernTemplate.templates.last, // 자유 형식
    );

    return template.getLocalizedPriorityChips(l10n);
  }

  Future<void> _addItem(String name) async {
    await ref
        .read(logicalFrameworkProvider(widget.concernId).notifier)
        .addComparisonItem(name: name, weight: 5.0);

    // 중간 저장을 위해 논리 분석 결과 저장
    await _saveIntermediateLogicalResult();
  }

  Future<void> _saveIntermediateLogicalResult() async {
    final analysisNotifier = ref.read(analysisResultProvider.notifier);
    final notifier = ref.read(
      logicalFrameworkProvider(widget.concernId).notifier,
    );
    final items = await notifier.getComparisonItems();

    final logicalData = {
      'items': items
          .map(
            (item) => {
              'name': item.name,
              'weight': item.weight,
              'scores': item.scores,
            },
          )
          .toList(),
      'isCompleted': false, // 아직 완료되지 않음
    };

    await analysisNotifier.saveLogicalResult(
      concernId: widget.concernId,
      logicalData: logicalData,
    );
  }

  Future<void> _showCustomItemDialog() async {
    final l10n = AppLocalizations.of(context)!;
    final controller = TextEditingController();

    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.addComparisonItem),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: l10n.comparisonItemNameHint),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                Navigator.pop(context, controller.text.trim());
              }
            },
            child: Text(l10n.add),
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
    final l10n = AppLocalizations.of(context)!;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          // 고민 상세 페이지로 바로 이동
          context.go('/concern/${widget.concernId}');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.comparisonItemSetup),
          actions: const [LanguageSelector()],
        ),
        body: FutureBuilder<List<ComparisonItem>>(
          future: _getItems(),
          builder: (context, snapshot) {
            final items = snapshot.data ?? [];

            return Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.paddingLarge,
                      AppSpacing.paddingLarge,
                      AppSpacing.paddingLarge,
                      AppSpacing.paddingLarge,
                    ),
                    children: [
                      Text(
                        l10n.selectComparisonItems,
                        style: AppTextStyles.headline3,
                      ),
                      const SizedBox(height: AppSpacing.paddingSmall),
                      Text(
                        l10n.selectImportantValues,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.paddingXLarge),
                      OutlinedButton.icon(
                        onPressed: _showCustomItemDialog,
                        icon: const Icon(Icons.add),
                        label: Text(l10n.addCustomItem),
                      ),
                      const SizedBox(height: AppSpacing.paddingLarge),
                      Text(
                        l10n.recommendedItems,
                        style: AppTextStyles.labelLarge,
                      ),
                      const SizedBox(height: AppSpacing.paddingMedium),
                      Wrap(
                        spacing: AppSpacing.paddingSmall,
                        runSpacing: AppSpacing.paddingSmall,
                        children: _getTemplateChips(l10n).map((item) {
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
                          l10n.selectedItems,
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
                    ],
                  ),
                ),
                // 하단 고정 버튼
                Container(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.paddingLarge,
                    AppSpacing.paddingLarge,
                    AppSpacing.paddingLarge,
                    AppSpacing.paddingXLarge + AppSpacing.paddingMedium,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grey00,
                    border: Border(
                      top: BorderSide(color: AppColors.grey30, width: 1),
                    ),
                  ),
                  child: SafeArea(
                    child: SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        text: l10n.next,
                        onPressed: items.isEmpty
                            ? null
                            : () {
                                context.push(
                                  '/concern/${widget.concernId}/scoring',
                                );
                              },
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
