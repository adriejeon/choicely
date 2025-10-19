import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/language_selector.dart';
import '../../../core/ads/admob_handler.dart';
import '../providers/concern_provider.dart';
import '../models/concern_template.dart';
import '../../../l10n/app_localizations.dart';

class AddConcernScreen extends ConsumerStatefulWidget {
  final ConcernTemplate? template;

  const AddConcernScreen({super.key, this.template});

  @override
  ConsumerState<AddConcernScreen> createState() => _AddConcernScreenState();
}

class _AddConcernScreenState extends ConsumerState<AddConcernScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final List<TextEditingController> _choiceControllers = [];
  int _numberOfChoices = 2; // 기본값: 2개
  bool _isLoading = false;
  ConcernTemplate? _selectedTemplate;

  @override
  void initState() {
    super.initState();
    // 기본값을 명시적으로 2개로 설정
    _numberOfChoices = 2;
    _updateChoiceControllers();

    // 템플릿이 제공된 경우 자동으로 채우기
    if (widget.template != null) {
      _selectedTemplate = widget.template!;
      _numberOfChoices = widget.template!.exampleChoices.length;
      _updateChoiceControllers();
    }
  }

  void _updateChoiceControllers() {
    // 필요한 만큼만 컨트롤러 추가/제거
    while (_choiceControllers.length < _numberOfChoices) {
      _choiceControllers.add(TextEditingController());
    }
    while (_choiceControllers.length > _numberOfChoices) {
      _choiceControllers.removeLast().dispose();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    for (var controller in _choiceControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _saveConcern() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final choices = _choiceControllers
            .map((controller) => controller.text.trim())
            .where((text) => text.isNotEmpty)
            .toList();

        await ref
            .read(concernListProvider.notifier)
            .addConcern(
              title: _titleController.text.trim(),
              description: _descriptionController.text.trim(),
              choices: choices,
              templateId: _selectedTemplate?.id,
            );

        if (mounted) {
          // 전면 광고 표시
          try {
            final admobHandler = AdmobHandler();
            if (admobHandler.isInterstitialAdLoaded) {
              await admobHandler.showInterstitialAd();
            } else {
              // 광고가 로드되지 않은 경우 미리 로드
              await admobHandler.loadInterstitialAd();
              if (admobHandler.isInterstitialAdLoaded) {
                await admobHandler.showInterstitialAd();
              }
            }
          } catch (e) {
            // 광고 로드/표시 실패 시 무시하고 계속 진행
            print('전면 광고 표시 실패: $e');
          }

          // 홈 화면으로 이동
          context.go('/');
          final l10n = AppLocalizations.of(context)!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.concernAdded),
              backgroundColor: AppColors.grey80,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('오류가 발생했습니다: $e'),
              backgroundColor: AppColors.grey80,
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
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
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.paddingLarge,
            AppSpacing.paddingLarge,
            AppSpacing.paddingLarge,
            AppSpacing.paddingXLarge * 2,
          ),
          children: [
            SectionHeader(
              title: l10n.whatIsYourConcern,
              subtitle: l10n.solveConcernDeeply,
              titleStyle: AppTextStyles.headline3,
            ),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: l10n.concernTitle,
                hintText:
                    _selectedTemplate?.getLocalizedExampleTitle(l10n) ??
                    l10n.concernTitleHint,
              ),
              style: AppTextStyles.bodyMedium,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.titleRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.paddingMedium),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: l10n.description,
                hintText:
                    _selectedTemplate?.getLocalizedExampleDescription(l10n) ??
                    l10n.descriptionHint,
                alignLabelWithHint: true,
              ),
              style: AppTextStyles.bodyMedium,
              maxLines: 8,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.descriptionRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.paddingLarge),
            SectionHeader(
              title: l10n.optionSetting,
              subtitle: l10n.howManyOptions,
              titleStyle: AppTextStyles.headline3,
            ),
            const SizedBox(height: AppSpacing.paddingMedium),
            Row(
              children: List.generate(4, (index) {
                final number = index + 1;
                final isSelected = _numberOfChoices == number;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index < 3 ? AppSpacing.paddingSmall : 0,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _numberOfChoices = number;
                          _updateChoiceControllers();
                        });
                      },
                      borderRadius: BorderRadius.circular(
                        AppSpacing.radiusSmall,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.paddingMedium,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.surfaceVariant,
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusSmall,
                          ),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          l10n.numberOfOptions(number.toString()),
                          style: AppTextStyles.labelMedium.copyWith(
                            color: isSelected
                                ? AppColors.grey00
                                : AppColors.textPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: AppSpacing.paddingMedium),
            ..._buildChoiceFields(l10n),
            const SizedBox(height: AppSpacing.paddingMedium),
            PrimaryButton(
              text: l10n.addConcernButton,
              onPressed: _saveConcern,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChoiceFields(AppLocalizations l10n) {
    final labels = ['A', 'B', 'C', 'D'];
    final colors = [
      AppColors.primary,
      Colors.teal,
      Colors.orange,
      Colors.purple,
    ];

    // 템플릿별 예시 선택지를 placeholder로 사용
    final hints =
        _selectedTemplate?.getLocalizedExampleChoices(l10n) ??
        [
          l10n.optionHint1,
          l10n.optionHint2,
          l10n.optionHint3,
          l10n.optionHint4,
        ];

    return List.generate(_numberOfChoices, (index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.paddingMedium),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.paddingLarge),
          decoration: BoxDecoration(
            color: colors[index].withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
            border: Border.all(color: colors[index].withValues(alpha: 0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: colors[index],
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
                  const SizedBox(width: AppSpacing.paddingSmall),
                  Text(
                    l10n.optionLabel(labels[index]),
                    style: AppTextStyles.labelMedium,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.paddingMedium),
              TextFormField(
                controller: _choiceControllers[index],
                decoration: InputDecoration(
                  hintText: hints[index],
                  filled: true,
                  fillColor: AppColors.surface,
                ),
                style: AppTextStyles.bodyMedium,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '${l10n.optionLabel(labels[index])} ${l10n.titleRequired.toLowerCase()}';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
