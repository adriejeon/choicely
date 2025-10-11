import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../l10n/app_localizations.dart';

class TarotCardSelectionScreen extends ConsumerStatefulWidget {
  final String concernId;
  final String choiceName;
  final int choiceIndex;

  const TarotCardSelectionScreen({
    super.key,
    required this.concernId,
    required this.choiceName,
    required this.choiceIndex,
  });

  @override
  ConsumerState<TarotCardSelectionScreen> createState() =>
      _TarotCardSelectionScreenState();
}

class _TarotCardSelectionScreenState
    extends ConsumerState<TarotCardSelectionScreen>
    with TickerProviderStateMixin {
  late AnimationController _flipController;
  late AnimationController _shuffleController;

  List<int> _cardIndices = [];
  int? _selectedCardIndex;
  bool _isCardSelected = false;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _shuffleController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _generateRandomCards();
  }

  @override
  void dispose() {
    _flipController.dispose();
    _shuffleController.dispose();
    super.dispose();
  }

  void _generateRandomCards() {
    final random = Random();
    final allCards = List.generate(35, (index) => index + 1); // 01.png ~ 35.png
    allCards.shuffle(random);
    _cardIndices = allCards.take(20).toList();
  }

  void _selectCard(int cardIndex) {
    if (_isCardSelected) return;

    setState(() {
      _selectedCardIndex = cardIndex;
      _isCardSelected = true;
    });

    _flipController.forward();
  }

  void _showCardResult() {
    // 바로 직관 분석 페이지로 돌아가기
    _goBackToTarot();
  }

  void _goBackToTarot() {
    Navigator.of(context).pop({
      'selectedCardIndex': _selectedCardIndex,
      'cardNumber': _cardIndices[_selectedCardIndex!],
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.destinyCardSelection),
        backgroundColor: AppColors.grey00,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.grey00, AppColors.grey00.withValues(alpha: 0.8)],
          ),
        ),
        child: Column(
          children: [
            // 상단 안내 텍스트
            Container(
              padding: const EdgeInsets.all(AppSpacing.paddingLarge),
              child: Column(
                children: [
                  Text(
                    widget.choiceName,
                    style: AppTextStyles.headline3.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(height: AppSpacing.paddingSmall),
                  Text(
                    l10n.selectCardYouLike,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // 카드 그리드
            Expanded(child: _buildCardGrid()),

            // 하단 버튼
            if (_isCardSelected)
              Container(
                padding: const EdgeInsets.all(AppSpacing.paddingLarge),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _showCardResult,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.grey00,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.paddingMedium,
                      ),
                    ),
                    child: Text(l10n.viewCardResult),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 반응형 그리드 계산
        final cardWidth = 80.0;
        final cardHeight = 120.0;
        final spacing = 8.0;

        final availableWidth =
            constraints.maxWidth - (AppSpacing.paddingLarge * 2);
        final cardsPerRow = ((availableWidth + spacing) / (cardWidth + spacing))
            .floor();
        final actualSpacing =
            (availableWidth - (cardsPerRow * cardWidth)) / (cardsPerRow - 1);

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.paddingLarge,
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: cardsPerRow,
              childAspectRatio: cardWidth / cardHeight,
              crossAxisSpacing: actualSpacing,
              mainAxisSpacing: actualSpacing,
            ),
            itemCount: _cardIndices.length,
            itemBuilder: (context, index) {
              final isSelected = _selectedCardIndex == index;

              return GestureDetector(
                onTap: () => _selectCard(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: _buildTarotCard(
                    cardIndex: _cardIndices[index],
                    isRevealed: _isCardSelected && isSelected,
                    isSelected: isSelected,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTarotCard({
    required int cardIndex,
    required bool isRevealed,
    required bool isSelected,
  }) {
    return AnimatedBuilder(
      animation: _flipController,
      builder: (context, child) {
        final flipValue = isRevealed ? _flipController.value : 0.0;
        final isShowingFront = flipValue > 0.5;

        return Container(
          // 선택된 카드가 가장 위에 오도록 z-index 설정
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(flipValue * pi),
            child: isShowingFront
                ? _buildCardFront(cardIndex, isSelected)
                : _buildCardBack(isSelected),
          ),
        );
      },
    );
  }

  Widget _buildCardBack([bool isSelected = false]) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ]
            : [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
        child: Image.asset(
          'assets/tarot_cards/card-back.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCardFront(int cardNumber, [bool isSelected = false]) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
        border: Border.all(color: AppColors.primary, width: isSelected ? 3 : 2),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ]
            : [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
        child: Image.asset(
          'assets/tarot_cards/${cardNumber.toString().padLeft(2, '0')}.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
