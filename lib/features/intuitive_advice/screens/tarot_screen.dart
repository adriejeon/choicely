import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/language_selector.dart';
import '../../../core/services/share_service.dart';
import '../../concern/providers/concern_provider.dart';
import '../../concern/providers/analysis_result_provider.dart';
import '../../../l10n/app_localizations.dart';
import 'tarot_card_selection_screen.dart';

class TarotScreen extends ConsumerStatefulWidget {
  final String concernId;

  const TarotScreen({super.key, required this.concernId});

  @override
  ConsumerState<TarotScreen> createState() => _TarotScreenState();
}

class _TarotScreenState extends ConsumerState<TarotScreen> {
  Map<int, int> _selectedTarotCards = {}; // 선택지 인덱스 -> 선택된 타로 카드 번호
  Map<int, Map<String, String>> _oracleCardInfo = {}; // 선택지 인덱스 -> 오라클 카드 정보
  int? _selectedChoiceIndex; // 최종 선택된 선택지 인덱스

  @override
  void initState() {
    super.initState();
    // 페이지 로드 시 분석 결과 새로고침
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(analysisResultProvider.notifier).refreshResults();
      _loadIntuitiveResult();
    });
  }

  void _drawTarotCard(int choiceIndex, String choiceName) async {
    final result = await Navigator.of(context).push<Map<String, dynamic>>(
      MaterialPageRoute(
        builder: (context) => TarotCardSelectionScreen(
          concernId: widget.concernId,
          choiceName: choiceName,
          choiceIndex: choiceIndex,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _selectedTarotCards[choiceIndex] = result['cardNumber'];
        _oracleCardInfo[choiceIndex] = _getOracleCardInfo(result['cardNumber']);
      });

      // 직관 분석 결과를 로컬 스토리지에 저장
      _saveIntuitiveResult();
    }
  }

  Map<String, String> _getOracleCardInfo(int cardNumber) {
    final l10n = AppLocalizations.of(context)!;

    // 오라클 카드별 정보 (1-35번)
    final cardInfo = {
      1: {
        'name': l10n.oracleCard1Name,
        'text': l10n.oracleCard1Text,
        'percentage': l10n.oracleCard1Percentage,
        'description': l10n.oracleCard1Description,
      },
      2: {
        'name': l10n.oracleCard2Name,
        'text': l10n.oracleCard2Text,
        'percentage': l10n.oracleCard2Percentage,
        'description': l10n.oracleCard2Description,
      },
      3: {
        'name': l10n.oracleCard3Name,
        'text': l10n.oracleCard3Text,
        'percentage': l10n.oracleCard3Percentage,
        'description': l10n.oracleCard3Description,
      },
      4: {
        'name': l10n.oracleCard4Name,
        'text': l10n.oracleCard4Text,
        'percentage': l10n.oracleCard4Percentage,
        'description': l10n.oracleCard4Description,
      },
      5: {
        'name': l10n.oracleCard5Name,
        'text': l10n.oracleCard5Text,
        'percentage': l10n.oracleCard5Percentage,
        'description': l10n.oracleCard5Description,
      },
      6: {
        'name': l10n.oracleCard6Name,
        'text': l10n.oracleCard6Text,
        'percentage': l10n.oracleCard6Percentage,
        'description': l10n.oracleCard6Description,
      },
      7: {
        'name': l10n.oracleCard7Name,
        'text': l10n.oracleCard7Text,
        'percentage': l10n.oracleCard7Percentage,
        'description': l10n.oracleCard7Description,
      },
      8: {
        'name': l10n.oracleCard8Name,
        'text': l10n.oracleCard8Text,
        'percentage': l10n.oracleCard8Percentage,
        'description': l10n.oracleCard8Description,
      },
      9: {
        'name': l10n.oracleCard9Name,
        'text': l10n.oracleCard9Text,
        'percentage': l10n.oracleCard9Percentage,
        'description': l10n.oracleCard9Description,
      },
      10: {
        'name': l10n.oracleCard10Name,
        'text': l10n.oracleCard10Text,
        'percentage': l10n.oracleCard10Percentage,
        'description': l10n.oracleCard10Description,
      },
      11: {
        'name': l10n.oracleCard11Name,
        'text': l10n.oracleCard11Text,
        'percentage': l10n.oracleCard11Percentage,
        'description': l10n.oracleCard11Description,
      },
      12: {
        'name': l10n.oracleCard12Name,
        'text': l10n.oracleCard12Text,
        'percentage': l10n.oracleCard12Percentage,
        'description': l10n.oracleCard12Description,
      },
      13: {
        'name': l10n.oracleCard13Name,
        'text': l10n.oracleCard13Text,
        'percentage': l10n.oracleCard13Percentage,
        'description': l10n.oracleCard13Description,
      },
      14: {
        'name': l10n.oracleCard14Name,
        'text': l10n.oracleCard14Text,
        'percentage': l10n.oracleCard14Percentage,
        'description': l10n.oracleCard14Description,
      },
      15: {
        'name': l10n.oracleCard15Name,
        'text': l10n.oracleCard15Text,
        'percentage': l10n.oracleCard15Percentage,
        'description': l10n.oracleCard15Description,
      },
      16: {
        'name': l10n.oracleCard16Name,
        'text': l10n.oracleCard16Text,
        'percentage': l10n.oracleCard16Percentage,
        'description': l10n.oracleCard16Description,
      },
      17: {
        'name': l10n.oracleCard17Name,
        'text': l10n.oracleCard17Text,
        'percentage': l10n.oracleCard17Percentage,
        'description': l10n.oracleCard17Description,
      },
      18: {
        'name': l10n.oracleCard18Name,
        'text': l10n.oracleCard18Text,
        'percentage': l10n.oracleCard18Percentage,
        'description': l10n.oracleCard18Description,
      },
      19: {
        'name': l10n.oracleCard19Name,
        'text': l10n.oracleCard19Text,
        'percentage': l10n.oracleCard19Percentage,
        'description': l10n.oracleCard19Description,
      },
      20: {
        'name': l10n.oracleCard20Name,
        'text': l10n.oracleCard20Text,
        'percentage': l10n.oracleCard20Percentage,
        'description': l10n.oracleCard20Description,
      },
      21: {
        'name': l10n.oracleCard21Name,
        'text': l10n.oracleCard21Text,
        'percentage': l10n.oracleCard21Percentage,
        'description': l10n.oracleCard21Description,
      },
      22: {
        'name': l10n.oracleCard22Name,
        'text': l10n.oracleCard22Text,
        'percentage': l10n.oracleCard22Percentage,
        'description': l10n.oracleCard22Description,
      },
      23: {
        'name': l10n.oracleCard23Name,
        'text': l10n.oracleCard23Text,
        'percentage': l10n.oracleCard23Percentage,
        'description': l10n.oracleCard23Description,
      },
      24: {
        'name': l10n.oracleCard24Name,
        'text': l10n.oracleCard24Text,
        'percentage': l10n.oracleCard24Percentage,
        'description': l10n.oracleCard24Description,
      },
      25: {
        'name': l10n.oracleCard25Name,
        'text': l10n.oracleCard25Text,
        'percentage': l10n.oracleCard25Percentage,
        'description': l10n.oracleCard25Description,
      },
      26: {
        'name': l10n.oracleCard26Name,
        'text': l10n.oracleCard26Text,
        'percentage': l10n.oracleCard26Percentage,
        'description': l10n.oracleCard26Description,
      },
      27: {
        'name': l10n.oracleCard27Name,
        'text': l10n.oracleCard27Text,
        'percentage': l10n.oracleCard27Percentage,
        'description': l10n.oracleCard27Description,
      },
      28: {
        'name': l10n.oracleCard28Name,
        'text': l10n.oracleCard28Text,
        'percentage': l10n.oracleCard28Percentage,
        'description': l10n.oracleCard28Description,
      },
      29: {
        'name': l10n.oracleCard29Name,
        'text': l10n.oracleCard29Text,
        'percentage': l10n.oracleCard29Percentage,
        'description': l10n.oracleCard29Description,
      },
      30: {
        'name': l10n.oracleCard30Name,
        'text': l10n.oracleCard30Text,
        'percentage': l10n.oracleCard30Percentage,
        'description': l10n.oracleCard30Description,
      },
      31: {
        'name': l10n.oracleCard31Name,
        'text': l10n.oracleCard31Text,
        'percentage': l10n.oracleCard31Percentage,
        'description': l10n.oracleCard31Description,
      },
      32: {
        'name': l10n.oracleCard32Name,
        'text': l10n.oracleCard32Text,
        'percentage': l10n.oracleCard32Percentage,
        'description': l10n.oracleCard32Description,
      },
      33: {
        'name': l10n.oracleCard33Name,
        'text': l10n.oracleCard33Text,
        'percentage': l10n.oracleCard33Percentage,
        'description': l10n.oracleCard33Description,
      },
      34: {
        'name': l10n.oracleCard34Name,
        'text': l10n.oracleCard34Text,
        'percentage': l10n.oracleCard34Percentage,
        'description': l10n.oracleCard34Description,
      },
      35: {
        'name': l10n.oracleCard35Name,
        'text': l10n.oracleCard35Text,
        'percentage': l10n.oracleCard35Percentage,
        'description': l10n.oracleCard35Description,
      },
    };

    return cardInfo[cardNumber] ??
        {
          'name': l10n.destinyMessage,
          'text': 'YES',
          'percentage': '50%',
          'description': l10n.destinyMessage,
        };
  }

  Future<void> _loadIntuitiveResult() async {
    final analysisNotifier = ref.read(analysisResultProvider.notifier);
    final result = analysisNotifier.getIntuitiveResult(widget.concernId);

    if (result != null) {
      final data = result.data;
      final selectedCardsRaw = data['selectedCards'];
      final selectedChoiceIndexRaw = data['selectedChoiceIndex'];

      if (selectedCardsRaw != null) {
        try {
          // JSON에서 로드된 데이터를 원래 형태로 변환
          final selectedCards = Map<int, int>.from(
            (selectedCardsRaw as Map<String, dynamic>).map(
              (key, value) =>
                  MapEntry(int.parse(key), int.parse(value.toString())),
            ),
          );

          // 카드 번호로부터 현재 언어의 카드 정보 생성
          final cardInfo = <int, Map<String, String>>{};
          for (final entry in selectedCards.entries) {
            final choiceIndex = entry.key;
            final cardNumber = entry.value;
            cardInfo[choiceIndex] = _getOracleCardInfo(cardNumber);
          }

          setState(() {
            _selectedTarotCards = selectedCards;
            _oracleCardInfo = cardInfo;
            // 선택된 선택지 인덱스도 로드
            if (selectedChoiceIndexRaw != null) {
              _selectedChoiceIndex = selectedChoiceIndexRaw as int?;
            }
          });
        } catch (e) {
          print('❌ [TAROT] Error loading intuitive result: $e');
        }
      }
    }
  }

  Future<void> _saveIntuitiveResult() async {
    final analysisNotifier = ref.read(analysisResultProvider.notifier);

    // 메시지 데이터 생성 (언어별 텍스트가 아닌 카드 번호 기반으로)
    final messages = <int, String>{};
    for (final entry in _selectedTarotCards.entries) {
      final choiceIndex = entry.key;
      final cardNumber = entry.value;
      final cardInfo = _getOracleCardInfo(cardNumber);
      messages[choiceIndex] = cardInfo['text'] ?? '';
    }

    final intuitiveData = {
      'selectedCards': _selectedTarotCards,
      'messages': messages,
      'selectedChoiceIndex': _selectedChoiceIndex, // 선택된 선택지 인덱스 추가
      'isCompleted': _selectedChoiceIndex != null, // 완료 여부 추가
    };

    await analysisNotifier.saveIntuitiveResult(
      concernId: widget.concernId,
      intuitiveData: intuitiveData,
    );
  }

  @override
  Widget build(BuildContext context) {
    final concernsAsync = ref.watch(concernListProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.intuitiveAnalysis),
        actions: const [LanguageSelector()],
      ),
      body: concernsAsync.when(
        data: (concerns) {
          final concern = concerns.firstWhere((c) => c.id == widget.concernId);
          final choices = concern.choices;

          if (choices.isEmpty) {
            return Center(child: Text('선택지가 없습니다'));
          }

          return _buildChoicesView(choices, l10n);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('오류: $error')),
      ),
    );
  }

  Widget _buildChoicesView(List<String> choices, AppLocalizations l10n) {
    final labels = ['A', 'B', 'C', 'D'];
    // 선택 상태에 따라 컬러 결정
    final getChoiceColor = (int index) {
      if (_selectedChoiceIndex == index) {
        return AppColors.primary;
      }
      return AppColors.grey30;
    };

    // 모든 선택지에 타로 카드가 뽑혔는지 확인
    final allChoicesHaveTarot = choices.asMap().entries.every(
      (entry) => _selectedTarotCards.containsKey(entry.key),
    );

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
              SizedBox(
                width: double.infinity,
                child: Text(
                  l10n.tarotCardAnalysis,
                  style: AppTextStyles.headline3,
                ),
              ),
              const SizedBox(height: AppSpacing.paddingSmall),
              SizedBox(
                width: double.infinity,
                child: Text(
                  l10n.tarotCardAnalysisDesc,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.paddingXLarge),
              ...List.generate(choices.length, (index) {
                final hasTarotCard = _selectedTarotCards.containsKey(index);

                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppSpacing.paddingLarge,
                  ),
                  child: _buildChoiceCard(
                    index: index,
                    label: labels[index],
                    choiceName: choices[index],
                    color: getChoiceColor(index),
                    hasTarotCard: hasTarotCard,
                    l10n: l10n,
                  ),
                );
              }),
            ],
          ),
        ),
        // 선택지 선택 버튼 (선택지가 선택되었을 때 표시)
        if (_selectedChoiceIndex != null)
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
                child: ElevatedButton(
                  onPressed: () async {
                    if (allChoicesHaveTarot) {
                      // 직관 분석 결과를 최종 저장
                      await _saveIntuitiveResult();
                      if (mounted) {
                        context.go('/concern/${widget.concernId}');
                      }
                    } else {
                      // 타로 카드가 아직 뽑히지 않은 선택지가 있는 경우
                      // 선택된 선택지의 타로 카드를 뽑도록 안내
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('먼저 모든 선택지의 타로 카드를 뽑아주세요'),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.grey00,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.paddingMedium,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppSpacing.radiusMedium,
                      ),
                    ),
                  ),
                  child: Text(
                    allChoicesHaveTarot
                        ? l10n.analysisComplete
                        : l10n.selectChoice,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildChoiceCard({
    required int index,
    required String label,
    required String choiceName,
    required Color color,
    required bool hasTarotCard,
    required AppLocalizations l10n,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedChoiceIndex = _selectedChoiceIndex == index ? null : index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _selectedChoiceIndex == index
              ? color.withValues(alpha: 0.05)
              : AppColors.grey00,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          border: Border.all(
            color: _selectedChoiceIndex == index
                ? color.withValues(alpha: 0.2)
                : AppColors.grey30,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            // 선택지 헤더
            Container(
              padding: const EdgeInsets.all(AppSpacing.paddingMedium),
              decoration: BoxDecoration(
                color: _selectedChoiceIndex == index
                    ? color.withValues(alpha: 0.1)
                    : AppColors.grey30.withValues(alpha: 0.1),
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
                      color: _selectedChoiceIndex == index
                          ? AppColors.primary
                          : AppColors.grey30,
                      borderRadius: BorderRadius.circular(
                        AppSpacing.radiusSmall,
                      ),
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
                      style: AppTextStyles.labelLarge.copyWith(
                        color: _selectedChoiceIndex == index
                            ? AppColors.grey80
                            : AppColors.grey80,
                      ),
                    ),
                  ),
                  // 공유 버튼 (타로 카드가 뽑혔을 때만 표시)
                  if (hasTarotCard) ...[
                    IconButton(
                      onPressed: () async {
                        final concernsAsync = ref.read(concernListProvider);
                        final concerns = concernsAsync.value;
                        if (concerns != null) {
                          final concern = concerns.firstWhere(
                            (c) => c.id == widget.concernId,
                          );
                          final cardInfo = _oracleCardInfo[index]!;
                          
                          await ShareService.shareIntuitiveAnalysis(
                            concernTitle: concern.title,
                            optionName: choiceName,
                            tarotCardName: cardInfo['name']!,
                            analysisResult: cardInfo['description']!,
                            context: context,
                          );
                        }
                      },
                      icon: const Icon(LucideIcons.share2, size: 20),
                      color: AppColors.grey80,
                      tooltip: l10n.share,
                    ),
                  ],
                  // 선택 상태 표시 (항상 표시)
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      value: _selectedChoiceIndex == index,
                      onChanged: (value) {
                        setState(() {
                          _selectedChoiceIndex = _selectedChoiceIndex == index
                              ? null
                              : index;
                        });
                      },
                      activeColor: color,
                      checkColor: AppColors.grey00,
                      fillColor: WidgetStateProperty.resolveWith<Color?>((
                        Set<WidgetState> states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return color;
                        }
                        return null; // 기본 테두리 색상 사용
                      }),
                      side: BorderSide(
                        color: _selectedChoiceIndex == index
                            ? color
                            : AppColors.grey80,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 카드 영역
            if (!hasTarotCard)
              Padding(
                padding: const EdgeInsets.all(AppSpacing.paddingLarge),
                child: Column(
                  children: [
                    Text(
                      l10n.checkDestinyForChoice,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.paddingMedium),
                    ElevatedButton(
                      onPressed: () => _drawTarotCard(index, choiceName),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.grey00,
                      ),
                      child: Text(l10n.drawTarotCard),
                    ),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(AppSpacing.paddingLarge),
                child: _buildTarotCardResult(index, color),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTarotCardResult(int choiceIndex, Color color) {
    final cardNumber = _selectedTarotCards[choiceIndex]!;
    final cardInfo = _oracleCardInfo[choiceIndex]!;

    return Column(
      children: [
        // 타로 카드 이미지
        Container(
          width: 120,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
            border: Border.all(color: color, width: 2),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
            child: Image.asset(
              'assets/tarot_cards/${cardNumber.toString().padLeft(2, '0')}.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.paddingLarge),

        // 오라클 카드 정보
        Container(
          padding: const EdgeInsets.all(AppSpacing.paddingMedium),
          decoration: BoxDecoration(
            color: cardInfo['text'] == 'YES'
                ? Colors.green.withValues(alpha: 0.1)
                : Colors.red.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppSpacing.radiusSmall),
            border: Border.all(
              color: cardInfo['text'] == 'YES'
                  ? Colors.green.withValues(alpha: 0.3)
                  : Colors.red.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            children: [
              // 카드 이름
              Text(
                cardInfo['name']!,
                style: AppTextStyles.headline4.copyWith(
                  color: AppColors.grey80,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.paddingSmall),

              // 확률 퍼센트와 NO/YES 배지
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cardInfo['percentage']!,
                    style: AppTextStyles.labelLarge.copyWith(
                      color: cardInfo['text'] == 'YES'
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.paddingSmall),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.paddingSmall,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: cardInfo['text'] == 'YES'
                          ? AppColors.success
                          : AppColors.error,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      cardInfo['text']!,
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.grey00,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.paddingSmall),

              // 상세 설명
              Text(
                cardInfo['description']!,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
