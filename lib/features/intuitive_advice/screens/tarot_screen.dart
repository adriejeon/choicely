import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../data/oracle_cards.dart';
import '../models/oracle_card.dart';
import '../../concern/providers/concern_provider.dart';

class TarotScreen extends ConsumerStatefulWidget {
  final String concernId;

  const TarotScreen({super.key, required this.concernId});

  @override
  ConsumerState<TarotScreen> createState() => _TarotScreenState();
}

class _TarotScreenState extends ConsumerState<TarotScreen> {
  Map<int, OracleCard> _selectedCards = {}; // 선택지 인덱스 -> 선택된 카드
  Map<int, bool> _revealedCards = {}; // 선택지 인덱스 -> 공개 여부

  void _drawCard(int choiceIndex) {
    setState(() {
      _selectedCards[choiceIndex] = OracleCards.drawRandomCard();
      _revealedCards[choiceIndex] = false;
    });

    // 자동으로 카드 뒤집기
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _revealedCards[choiceIndex] = true;
        });
      }
    });
  }

  void _reset(int choiceIndex) {
    setState(() {
      _selectedCards.remove(choiceIndex);
      _revealedCards.remove(choiceIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final concernsAsync = ref.watch(concernListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('직관 분석')),
      body: concernsAsync.when(
        data: (concerns) {
          final concern = concerns.firstWhere((c) => c.id == widget.concernId);
          final choices = concern.choices;

          if (choices.isEmpty) {
            return Center(child: Text('선택지가 없습니다'));
          }

          return _buildChoicesView(choices);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('오류: $error')),
      ),
    );
  }

  Widget _buildChoicesView(List<String> choices) {
    final labels = ['A', 'B', 'C', 'D'];
    final colors = [
      AppColors.primary,
      Colors.teal,
      Colors.orange,
      Colors.purple,
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.paddingLarge,
        AppSpacing.paddingLarge,
        AppSpacing.paddingLarge,
        AppSpacing.paddingXLarge,
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.paddingLarge),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.mystical.withValues(alpha: 0.2),
                AppColors.mysticalLight.withValues(alpha: 0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          ),
          child: Column(
            children: [
              Icon(Icons.auto_awesome, size: 48, color: AppColors.mystical),
              const SizedBox(height: AppSpacing.paddingMedium),
              Text(
                '오라클 카드 리딩',
                style: AppTextStyles.headline3.copyWith(
                  color: AppColors.mystical,
                ),
              ),
              const SizedBox(height: AppSpacing.paddingSmall),
              Text(
                '각 선택지마다 카드를 뽑아\n운명의 메시지를 받아보세요',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.paddingXLarge),
        ...List.generate(choices.length, (index) {
          final hasCard = _selectedCards.containsKey(index);
          final isRevealed = _revealedCards[index] ?? false;

          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.paddingLarge),
            child: _buildChoiceCard(
              index: index,
              label: labels[index],
              choiceName: choices[index],
              color: colors[index],
              hasCard: hasCard,
              isRevealed: isRevealed,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildChoiceCard({
    required int index,
    required String label,
    required String choiceName,
    required Color color,
    required bool hasCard,
    required bool isRevealed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 2),
      ),
      child: Column(
        children: [
          // 선택지 헤더
          Container(
            padding: const EdgeInsets.all(AppSpacing.paddingMedium),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSpacing.radiusMedium - 2),
                topRight: Radius.circular(AppSpacing.radiusMedium - 2),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.grey00,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.paddingMedium),
                Expanded(
                  child: Text(
                    choiceName,
                    style: AppTextStyles.labelLarge.copyWith(color: color),
                  ),
                ),
              ],
            ),
          ),
          // 카드 영역
          if (!hasCard)
            Padding(
              padding: const EdgeInsets.all(AppSpacing.paddingLarge),
              child: Column(
                children: [
                  Icon(Icons.auto_awesome, size: 48, color: color),
                  const SizedBox(height: AppSpacing.paddingMedium),
                  Text(
                    '이 선택지의 운명을\n확인해보세요',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.paddingMedium),
                  ElevatedButton(
                    onPressed: () => _drawCard(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: AppColors.grey00,
                    ),
                    child: const Text('카드 뽑기'),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(AppSpacing.paddingLarge),
              child: _buildCardResult(index, color, isRevealed),
            ),
        ],
      ),
    );
  }

  Widget _buildCardResult(int choiceIndex, Color color, bool isRevealed) {
    final card = _selectedCards[choiceIndex]!;

    // 길흉 색상
    Color fortuneColor;
    IconData fortuneIcon;
    switch (card.fortune) {
      case 'excellent':
        fortuneColor = Colors.green;
        fortuneIcon = Icons.star;
        break;
      case 'good':
        fortuneColor = Colors.lightGreen;
        fortuneIcon = Icons.thumb_up;
        break;
      case 'neutral':
        fortuneColor = Colors.orange;
        fortuneIcon = Icons.balance;
        break;
      case 'caution':
        fortuneColor = Colors.red;
        fortuneIcon = Icons.warning;
        break;
      default:
        fortuneColor = Colors.grey;
        fortuneIcon = Icons.help;
    }

    return Column(
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: isRevealed ? 1 : 0),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(value * pi),
              child: value < 0.5
                  ? _buildCardBack(color)
                  : Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..rotateY(pi),
                      child: _buildCardFront(card, fortuneColor, fortuneIcon),
                    ),
            );
          },
        ),
        if (isRevealed) ...[
          const SizedBox(height: AppSpacing.paddingLarge),
          Container(
            padding: const EdgeInsets.all(AppSpacing.paddingMedium),
            decoration: BoxDecoration(
              color: fortuneColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
              border: Border.all(color: fortuneColor.withValues(alpha: 0.3)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(fortuneIcon, color: fortuneColor, size: 20),
                    const SizedBox(width: AppSpacing.paddingSmall),
                    Text(
                      '길흉: ${card.fortuneScore}/10',
                      style: AppTextStyles.labelMedium.copyWith(
                        color: fortuneColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.paddingSmall),
                Text(
                  card.message,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.paddingMedium),
          OutlinedButton(
            onPressed: () => _reset(choiceIndex),
            style: OutlinedButton.styleFrom(
              foregroundColor: color,
              side: BorderSide(color: color),
            ),
            child: const Text('다시 뽑기'),
          ),
        ],
      ],
    );
  }

  Widget _buildCardBack(Color color) {
    return Container(
      width: 150,
      height: 220,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            color.withValues(alpha: 0.7),
            color.withValues(alpha: 0.5),
          ],
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.auto_awesome,
          size: 60,
          color: AppColors.grey00.withValues(alpha: 0.5),
        ),
      ),
    );
  }

  Widget _buildCardFront(
    OracleCard card,
    Color fortuneColor,
    IconData fortuneIcon,
  ) {
    return Container(
      width: 150,
      height: 220,
      decoration: BoxDecoration(
        color: AppColors.grey00,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        border: Border.all(color: fortuneColor, width: 3),
        boxShadow: [
          BoxShadow(
            color: fortuneColor.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.paddingMedium),
            decoration: BoxDecoration(
              color: fortuneColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(fortuneIcon, size: 40, color: fortuneColor),
          ),
          const SizedBox(height: AppSpacing.paddingMedium),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.paddingMedium,
            ),
            child: Column(
              children: [
                Text(
                  card.nameKo,
                  style: AppTextStyles.labelLarge.copyWith(color: fortuneColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  card.name,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textTertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.paddingSmall),
                Text(
                  card.description,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
