import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/language_selector.dart';
import '../models/concern_template.dart';
import '../../../l10n/app_localizations.dart';

class TemplateSelectionScreen extends ConsumerStatefulWidget {
  const TemplateSelectionScreen({super.key});

  @override
  ConsumerState<TemplateSelectionScreen> createState() =>
      _TemplateSelectionScreenState();
}

class _TemplateSelectionScreenState
    extends ConsumerState<TemplateSelectionScreen> {
  ConcernTemplate? _selectedTemplate;

  void _selectTemplate(ConcernTemplate template) {
    setState(() {
      _selectedTemplate = template;
    });
  }

  void _proceedToAddConcern() {
    if (_selectedTemplate != null) {
      context.push('/add-concern', extra: _selectedTemplate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.addConcern),
        actions: const [LanguageSelector()],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.paddingLarge,
          AppSpacing.paddingLarge,
          AppSpacing.paddingLarge,
          AppSpacing.paddingXLarge * 2,
        ),
        children: [
          SectionHeader(
            title: l10n.templateSelection,
            subtitle: l10n.templateSelectionDesc,
            titleStyle: AppTextStyles.headline3,
          ),
          const SizedBox(height: AppSpacing.paddingMedium),
          _buildTemplateGrid(l10n),
          const SizedBox(height: AppSpacing.paddingXLarge),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _selectedTemplate != null
                  ? _proceedToAddConcern
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedTemplate != null
                    ? AppColors.primary
                    : AppColors.grey40,
                foregroundColor: AppColors.grey00,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
                ),
              ),
              child: Text(
                l10n.createConcern,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTemplateGrid(AppLocalizations l10n) {
    return Column(
      children: [
        // 첫 번째 줄: 진로/커리어, 소비/재테크
        Row(
          children: [
            Expanded(
              child: _buildTemplateCard(ConcernTemplate.templates[0], l10n),
            ),
            const SizedBox(width: AppSpacing.paddingMedium),
            Expanded(
              child: _buildTemplateCard(ConcernTemplate.templates[1], l10n),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.paddingMedium),
        // 두 번째 줄: 인간관계, 일상/습관
        Row(
          children: [
            Expanded(
              child: _buildTemplateCard(ConcernTemplate.templates[2], l10n),
            ),
            const SizedBox(width: AppSpacing.paddingMedium),
            Expanded(
              child: _buildTemplateCard(ConcernTemplate.templates[3], l10n),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.paddingMedium),
        // 세 번째 줄: 자유 형식 (전체 너비)
        SizedBox(
          width: double.infinity,
          child: _buildTemplateCard(ConcernTemplate.templates[4], l10n),
        ),
      ],
    );
  }

  Widget _buildTemplateCard(ConcernTemplate template, AppLocalizations l10n) {
    final isSelected = _selectedTemplate?.id == template.id;

    return InkWell(
      onTap: () => _selectTemplate(template),
      borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.paddingLarge),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.1)
              : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          border: isSelected
              ? Border.all(color: AppColors.primary, width: 2)
              : null,
        ),
        child: Column(
          children: [
            Icon(
              template.icon,
              size: 32,
              color: isSelected ? AppColors.primary : AppColors.grey60,
            ),
            const SizedBox(height: AppSpacing.paddingSmall),
            Text(
              template.getLocalizedTitle(l10n),
              style: AppTextStyles.labelLarge.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.paddingSmall),
            Text(
              template.getLocalizedDescription(l10n),
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
