import '../models/oracle_card.dart';
import 'dart:math';

class OracleCards {
  static final List<OracleCard> _cards = [
    // 매우 길한 카드 (9-10점)
    OracleCard(
      id: 1,
      name: 'New Beginnings',
      nameKo: '새로운 시작',
      description: '새로운 가능성이 당신 앞에 펼쳐집니다',
      message: '이 선택은 당신에게 새로운 시작과 무한한 가능성을 가져다줄 것입니다. 용기를 내어 첫걸음을 내디디세요.',
      image: 'assets/cards/new_beginnings.png',
      fortune: 'excellent',
      fortuneScore: 10,
    ),
    OracleCard(
      id: 2,
      name: 'Divine Guidance',
      nameKo: '신성한 인도',
      description: '우주가 당신을 올바른 방향으로 인도하고 있습니다',
      message: '이 선택은 우주의 흐름과 완벽하게 조화를 이룹니다. 당신의 직관을 믿고 나아가세요.',
      image: 'assets/cards/divine_guidance.png',
      fortune: 'excellent',
      fortuneScore: 10,
    ),
    OracleCard(
      id: 3,
      name: 'Abundance',
      nameKo: '풍요',
      description: '풍요와 번영이 당신을 기다리고 있습니다',
      message: '이 선택은 물질적, 정신적 풍요를 가져다줄 것입니다. 감사한 마음으로 받아들이세요.',
      image: 'assets/cards/abundance.png',
      fortune: 'excellent',
      fortuneScore: 9,
    ),
    OracleCard(
      id: 4,
      name: 'Inner Wisdom',
      nameKo: '내면의 지혜',
      description: '당신의 내면이 이미 답을 알고 있습니다',
      message: '이 선택은 당신의 진정한 자아와 연결되어 있습니다. 내면의 목소리에 귀 기울이세요.',
      image: 'assets/cards/inner_wisdom.png',
      fortune: 'excellent',
      fortuneScore: 9,
    ),
    OracleCard(
      id: 5,
      name: 'Joy',
      nameKo: '기쁨',
      description: '행복과 기쁨이 가득한 시간이 올 것입니다',
      message: '이 선택은 당신에게 진정한 행복과 만족감을 선사할 것입니다. 마음껏 즐기세요.',
      image: 'assets/cards/joy.png',
      fortune: 'excellent',
      fortuneScore: 9,
    ),

    // 좋은 카드 (7-8점)
    OracleCard(
      id: 6,
      name: 'Growth',
      nameKo: '성장',
      description: '개인적 성장과 발전의 기회입니다',
      message: '이 선택은 당신을 한 단계 성장시킬 것입니다. 배움의 과정을 즐기세요.',
      image: 'assets/cards/growth.png',
      fortune: 'good',
      fortuneScore: 8,
    ),
    OracleCard(
      id: 7,
      name: 'Courage',
      nameKo: '용기',
      description: '용기를 내어 도전하세요',
      message: '이 선택은 당신의 용기를 필요로 하지만, 그만한 가치가 있습니다. 두려움을 극복하세요.',
      image: 'assets/cards/courage.png',
      fortune: 'good',
      fortuneScore: 8,
    ),
    OracleCard(
      id: 8,
      name: 'Harmony',
      nameKo: '조화',
      description: '균형과 조화를 이룰 것입니다',
      message: '이 선택은 당신의 삶에 균형과 평화를 가져다줄 것입니다. 조화를 추구하세요.',
      image: 'assets/cards/harmony.png',
      fortune: 'good',
      fortuneScore: 8,
    ),
    OracleCard(
      id: 9,
      name: 'Trust',
      nameKo: '신뢰',
      description: '과정을 신뢰하세요',
      message: '이 선택은 당신이 생각하는 것보다 더 좋은 결과를 가져올 것입니다. 신뢰하고 기다리세요.',
      image: 'assets/cards/trust.png',
      fortune: 'good',
      fortuneScore: 7,
    ),
    OracleCard(
      id: 10,
      name: 'Creativity',
      nameKo: '창의성',
      description: '창의적인 해결책이 나타날 것입니다',
      message: '이 선택은 당신의 창의성을 발휘할 수 있는 기회를 제공합니다. 새로운 시각으로 바라보세요.',
      image: 'assets/cards/creativity.png',
      fortune: 'good',
      fortuneScore: 7,
    ),

    // 중립 카드 (5-6점)
    OracleCard(
      id: 11,
      name: 'Patience',
      nameKo: '인내',
      description: '때를 기다리는 지혜가 필요합니다',
      message: '이 선택은 즉각적인 결과를 가져오지 않을 수 있습니다. 인내심을 가지고 기다리세요.',
      image: 'assets/cards/patience.png',
      fortune: 'neutral',
      fortuneScore: 6,
    ),
    OracleCard(
      id: 12,
      name: 'Reflection',
      nameKo: '성찰',
      description: '더 깊이 생각해볼 필요가 있습니다',
      message: '이 선택은 신중한 고려가 필요합니다. 충분히 성찰한 후 결정하세요.',
      image: 'assets/cards/reflection.png',
      fortune: 'neutral',
      fortuneScore: 6,
    ),
    OracleCard(
      id: 13,
      name: 'Balance',
      nameKo: '균형',
      description: '양쪽의 관점을 모두 고려하세요',
      message: '이 선택은 장단점이 공존합니다. 균형 잡힌 시각으로 판단하세요.',
      image: 'assets/cards/balance.png',
      fortune: 'neutral',
      fortuneScore: 5,
    ),
    OracleCard(
      id: 14,
      name: 'Uncertainty',
      nameKo: '불확실성',
      description: '아직 결정하기 이른 시기입니다',
      message: '이 선택의 결과는 아직 명확하지 않습니다. 더 많은 정보를 수집하세요.',
      image: 'assets/cards/uncertainty.png',
      fortune: 'neutral',
      fortuneScore: 5,
    ),

    // 주의 카드 (3-4점)
    OracleCard(
      id: 15,
      name: 'Caution',
      nameKo: '주의',
      description: '신중하게 접근해야 합니다',
      message: '이 선택은 예상치 못한 어려움을 동반할 수 있습니다. 주의 깊게 진행하세요.',
      image: 'assets/cards/caution.png',
      fortune: 'caution',
      fortuneScore: 4,
    ),
    OracleCard(
      id: 16,
      name: 'Challenge',
      nameKo: '도전',
      description: '어려운 시기를 맞이할 수 있습니다',
      message: '이 선택은 많은 노력과 인내를 요구할 것입니다. 각오를 단단히 하세요.',
      image: 'assets/cards/challenge.png',
      fortune: 'caution',
      fortuneScore: 4,
    ),
    OracleCard(
      id: 17,
      name: 'Delay',
      nameKo: '지연',
      description: '기대한 것보다 시간이 걸릴 것입니다',
      message: '이 선택은 예상보다 오랜 시간이 필요할 수 있습니다. 서두르지 마세요.',
      image: 'assets/cards/delay.png',
      fortune: 'caution',
      fortuneScore: 3,
    ),
    OracleCard(
      id: 18,
      name: 'Reconsider',
      nameKo: '재고',
      description: '다시 한번 생각해볼 필요가 있습니다',
      message: '이 선택은 당신이 원하는 결과를 가져다주지 않을 수 있습니다. 다른 대안을 고려해보세요.',
      image: 'assets/cards/reconsider.png',
      fortune: 'caution',
      fortuneScore: 3,
    ),
  ];

  /// 랜덤으로 카드 뽑기
  static OracleCard drawRandomCard() {
    final random = Random();
    return _cards[random.nextInt(_cards.length)];
  }

  /// 모든 카드 가져오기
  static List<OracleCard> getAllCards() {
    return List.unmodifiable(_cards);
  }

  /// ID로 카드 가져오기
  static OracleCard? getCardById(int id) {
    try {
      return _cards.firstWhere((card) => card.id == id);
    } catch (e) {
      return null;
    }
  }

  /// 길흉별로 카드 필터링
  static List<OracleCard> getCardsByFortune(String fortune) {
    return _cards.where((card) => card.fortune == fortune).toList();
  }
}
