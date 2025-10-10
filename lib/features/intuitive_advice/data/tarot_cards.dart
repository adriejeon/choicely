/// 타로 카드 데이터 모델
class TarotCard {
  final String id;
  final String name;
  final String description;
  final String upright; // 정방향 의미
  final String reversed; // 역방향 의미
  final String imagePath;

  const TarotCard({
    required this.id,
    required this.name,
    required this.description,
    required this.upright,
    required this.reversed,
    required this.imagePath,
  });
}

/// 타로 카드 데이터 (간단한 메이저 아르카나 22장)
class TarotCards {
  static const List<TarotCard> majorArcana = [
    TarotCard(
      id: '0',
      name: '바보(The Fool)',
      description: '새로운 시작, 순수함, 자유',
      upright: '새로운 시작과 가능성이 열립니다. 두려움 없이 도전하세요.',
      reversed: '경솔함과 무모함을 조심하세요. 신중한 판단이 필요합니다.',
      imagePath: 'assets/tarot_cards/fool.png',
    ),
    TarotCard(
      id: '1',
      name: '마법사(The Magician)',
      description: '재능, 의지, 창조',
      upright: '당신에게 필요한 모든 도구가 갖춰져 있습니다. 자신감을 가지세요.',
      reversed: '재능을 잘못 사용하거나 속임수를 조심하세요.',
      imagePath: 'assets/tarot_cards/magician.png',
    ),
    TarotCard(
      id: '2',
      name: '여사제(The High Priestess)',
      description: '직관, 신비, 내면',
      upright: '내면의 소리에 귀를 기울이세요. 직관을 믿으세요.',
      reversed: '비밀이나 숨겨진 의도를 조심하세요.',
      imagePath: 'assets/tarot_cards/high_priestess.png',
    ),
    TarotCard(
      id: '3',
      name: '여황제(The Empress)',
      description: '풍요, 사랑, 자연',
      upright: '풍요와 창조의 시기입니다. 사랑과 돌봄이 필요합니다.',
      reversed: '과잉 보호나 의존을 조심하세요.',
      imagePath: 'assets/tarot_cards/empress.png',
    ),
    TarotCard(
      id: '4',
      name: '황제(The Emperor)',
      description: '권위, 구조, 안정',
      upright: '질서와 구조가 필요합니다. 리더십을 발휘하세요.',
      reversed: '과도한 통제나 경직성을 조심하세요.',
      imagePath: 'assets/tarot_cards/emperor.png',
    ),
    TarotCard(
      id: '5',
      name: '교황(The Hierophant)',
      description: '전통, 가르침, 영성',
      upright: '전통적인 방법이나 조언이 도움이 됩니다.',
      reversed: '고정관념이나 융통성 없음을 조심하세요.',
      imagePath: 'assets/tarot_cards/hierophant.png',
    ),
    TarotCard(
      id: '6',
      name: '연인(The Lovers)',
      description: '사랑, 선택, 조화',
      upright: '중요한 선택의 시기입니다. 마음의 소리를 따르세요.',
      reversed: '갈등이나 잘못된 선택을 조심하세요.',
      imagePath: 'assets/tarot_cards/lovers.png',
    ),
    TarotCard(
      id: '7',
      name: '전차(The Chariot)',
      description: '의지, 성공, 통제',
      upright: '목표를 향해 나아갈 힘이 있습니다. 집중하세요.',
      reversed: '방향 상실이나 통제력 부족을 조심하세요.',
      imagePath: 'assets/tarot_cards/chariot.png',
    ),
    TarotCard(
      id: '8',
      name: '힘(Strength)',
      description: '용기, 인내, 내적 힘',
      upright: '내면의 힘으로 어려움을 극복할 수 있습니다.',
      reversed: '자신감 부족이나 무력감을 조심하세요.',
      imagePath: 'assets/tarot_cards/strength.png',
    ),
    TarotCard(
      id: '9',
      name: '은둔자(The Hermit)',
      description: '성찰, 고독, 지혜',
      upright: '혼자만의 시간이 필요합니다. 내면을 들여다보세요.',
      reversed: '고립이나 외로움을 조심하세요.',
      imagePath: 'assets/tarot_cards/hermit.png',
    ),
    TarotCard(
      id: '10',
      name: '운명의 수레바퀴(Wheel of Fortune)',
      description: '변화, 운명, 순환',
      upright: '긍정적인 변화의 시기입니다. 흐름을 따르세요.',
      reversed: '예상치 못한 변화나 불운을 조심하세요.',
      imagePath: 'assets/tarot_cards/wheel_of_fortune.png',
    ),
    TarotCard(
      id: '11',
      name: '정의(Justice)',
      description: '공정, 진실, 균형',
      upright: '공정한 결과를 얻을 것입니다. 진실이 드러납니다.',
      reversed: '불공정하거나 편향된 판단을 조심하세요.',
      imagePath: 'assets/tarot_cards/justice.png',
    ),
    TarotCard(
      id: '12',
      name: '매달린 사람(The Hanged Man)',
      description: '포기, 관점 전환, 희생',
      upright: '새로운 관점이 필요합니다. 포기하고 기다리세요.',
      reversed: '불필요한 희생이나 정체를 조심하세요.',
      imagePath: 'assets/tarot_cards/hanged_man.png',
    ),
    TarotCard(
      id: '13',
      name: '죽음(Death)',
      description: '변화, 끝, 새로운 시작',
      upright: '한 시대가 끝나고 새로운 시작이 옵니다.',
      reversed: '변화에 대한 저항이나 두려움을 조심하세요.',
      imagePath: 'assets/tarot_cards/death.png',
    ),
    TarotCard(
      id: '14',
      name: '절제(Temperance)',
      description: '균형, 조화, 중용',
      upright: '균형과 절제가 필요합니다. 중용의 길을 가세요.',
      reversed: '극단이나 불균형을 조심하세요.',
      imagePath: 'assets/tarot_cards/temperance.png',
    ),
    TarotCard(
      id: '15',
      name: '악마(The Devil)',
      description: '유혹, 속박, 물질',
      upright: '속박이나 유혹을 인식하세요. 자유를 찾으세요.',
      reversed: '속박에서 벗어날 수 있습니다. 해방의 시기입니다.',
      imagePath: 'assets/tarot_cards/devil.png',
    ),
    TarotCard(
      id: '16',
      name: '탑(The Tower)',
      description: '파괴, 변혁, 계시',
      upright: '급격한 변화나 충격이 있을 수 있습니다. 재건이 필요합니다.',
      reversed: '변화에 대한 저항이나 작은 위기를 조심하세요.',
      imagePath: 'assets/tarot_cards/tower.png',
    ),
    TarotCard(
      id: '17',
      name: '별(The Star)',
      description: '희망, 영감, 평온',
      upright: '희망과 영감의 시기입니다. 긍정적으로 생각하세요.',
      reversed: '희망 상실이나 절망을 조심하세요.',
      imagePath: 'assets/tarot_cards/star.png',
    ),
    TarotCard(
      id: '18',
      name: '달(The Moon)',
      description: '환상, 두려움, 직관',
      upright: '불확실성과 환상을 조심하세요. 직관을 믿으세요.',
      reversed: '두려움이 사라지고 진실이 드러납니다.',
      imagePath: 'assets/tarot_cards/moon.png',
    ),
    TarotCard(
      id: '19',
      name: '태양(The Sun)',
      description: '성공, 기쁨, 활력',
      upright: '성공과 기쁨의 시기입니다. 긍정적인 에너지가 넘칩니다.',
      reversed: '과도한 낙관이나 작은 좌절을 조심하세요.',
      imagePath: 'assets/tarot_cards/sun.png',
    ),
    TarotCard(
      id: '20',
      name: '심판(Judgement)',
      description: '각성, 평가, 부활',
      upright: '과거를 평가하고 새로운 시작을 준비하세요.',
      reversed: '자기 판단이나 후회를 조심하세요.',
      imagePath: 'assets/tarot_cards/judgement.png',
    ),
    TarotCard(
      id: '21',
      name: '세계(The World)',
      description: '완성, 성취, 통합',
      upright: '목표를 달성하고 완성의 시기를 맞이합니다.',
      reversed: '미완성이나 지연을 조심하세요.',
      imagePath: 'assets/tarot_cards/world.png',
    ),
  ];

  /// 랜덤 카드 뽑기
  static TarotCard drawRandomCard() {
    final random = DateTime.now().millisecondsSinceEpoch;
    final index = random % majorArcana.length;
    return majorArcana[index];
  }

  /// 여러 장 뽑기
  static List<TarotCard> drawMultipleCards(int count) {
    final cards = List<TarotCard>.from(majorArcana);
    cards.shuffle();
    return cards.take(count).toList();
  }
}
