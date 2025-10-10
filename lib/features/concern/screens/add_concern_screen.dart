import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/section_header.dart';
import '../providers/concern_provider.dart';

class AddConcernScreen extends ConsumerStatefulWidget {
  const AddConcernScreen({super.key});

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

  @override
  void initState() {
    super.initState();
    _updateChoiceControllers();
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
            );

        if (mounted) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('고민이 추가되었습니다'),
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
    return Scaffold(
      appBar: AppBar(title: const Text('새로운 고민')),
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
              title: '무엇이 고민이신가요?',
              subtitle: '심층적으로 고민을 해결해 보세요.',
              titleStyle: AppTextStyles.headline3,
            ),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: '고민 제목',
                hintText: '예: A회사와 B회사 중 어디로 갈까?',
              ),
              style: AppTextStyles.bodyMedium,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '제목을 입력해주세요';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.paddingMedium),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: '상세 설명',
                hintText: '고민에 대해 자세히 설명해주세요',
                alignLabelWithHint: true,
              ),
              style: AppTextStyles.bodyMedium,
              maxLines: 8,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '설명을 입력해주세요';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.paddingLarge),
            SectionHeader(
              title: '선택지 설정',
              subtitle: '몇 가지 선택지를 두고 고민 중이신가요?',
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
                          '$number개',
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
            ..._buildChoiceFields(),
            const SizedBox(height: AppSpacing.paddingMedium),
            PrimaryButton(
              text: '고민 추가하기',
              onPressed: _saveConcern,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChoiceFields() {
    final labels = ['A', 'B', 'C', 'D'];
    final colors = [
      AppColors.primary,
      Colors.teal,
      Colors.orange,
      Colors.purple,
    ];
    final hints = ['예: A 회사로 이직', '예: B 회사로 이직', '예: 현재 회사에 남기', '예: 창업하기'];

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
                    '선택지 ${labels[index]}',
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
                    return '선택지 ${labels[index]}를 입력해주세요';
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
