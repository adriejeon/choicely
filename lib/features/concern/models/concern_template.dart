import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../l10n/app_localizations.dart';

class ConcernTemplate {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final String exampleTitle;
  final String exampleDescription;
  final List<String> exampleChoices;
  final List<String> priorityChips;

  const ConcernTemplate({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.exampleTitle,
    required this.exampleDescription,
    required this.exampleChoices,
    required this.priorityChips,
  });

  // 다국어 지원 메서드들
  String getLocalizedTitle(AppLocalizations l10n) {
    switch (id) {
      case 'career':
        return l10n.templateCareerTitle;
      case 'finance':
        return l10n.templateFinanceTitle;
      case 'relationship':
        return l10n.templateRelationshipTitle;
      case 'lifestyle':
        return l10n.templateLifestyleTitle;
      case 'free':
        return l10n.templateFreeTitle;
      default:
        return title;
    }
  }

  String getLocalizedDescription(AppLocalizations l10n) {
    switch (id) {
      case 'career':
        return l10n.templateCareerDesc;
      case 'finance':
        return l10n.templateFinanceDesc;
      case 'relationship':
        return l10n.templateRelationshipDesc;
      case 'lifestyle':
        return l10n.templateLifestyleDesc;
      case 'free':
        return l10n.templateFreeDesc;
      default:
        return description;
    }
  }

  String getLocalizedExampleTitle(AppLocalizations l10n) {
    switch (id) {
      case 'career':
        return l10n.templateCareerExample;
      case 'finance':
        return l10n.templateFinanceExample;
      case 'relationship':
        return l10n.templateRelationshipExample;
      case 'lifestyle':
        return l10n.templateLifestyleExample;
      case 'free':
        return l10n.templateFreeExample;
      default:
        return exampleTitle;
    }
  }

  String getLocalizedExampleDescription(AppLocalizations l10n) {
    switch (id) {
      case 'career':
        return l10n.templateCareerExampleDesc;
      case 'finance':
        return l10n.templateFinanceExampleDesc;
      case 'relationship':
        return l10n.templateRelationshipExampleDesc;
      case 'lifestyle':
        return l10n.templateLifestyleExampleDesc;
      case 'free':
        return l10n.templateFreeExampleDesc;
      default:
        return exampleDescription;
    }
  }

  List<String> getLocalizedExampleChoices(AppLocalizations l10n) {
    switch (id) {
      case 'career':
        return [
          l10n.templateCareerChoice1,
          l10n.templateCareerChoice2,
          l10n.templateCareerChoice3,
          l10n.templateCareerChoice4,
        ];
      case 'finance':
        return [
          l10n.templateFinanceChoice1,
          l10n.templateFinanceChoice2,
          l10n.templateFinanceChoice3,
          l10n.templateFinanceChoice4,
        ];
      case 'relationship':
        return [
          l10n.templateRelationshipChoice1,
          l10n.templateRelationshipChoice2,
          l10n.templateRelationshipChoice3,
          l10n.templateRelationshipChoice4,
        ];
      case 'lifestyle':
        return [
          l10n.templateLifestyleChoice1,
          l10n.templateLifestyleChoice2,
          l10n.templateLifestyleChoice3,
          l10n.templateLifestyleChoice4,
        ];
      case 'free':
        return [
          l10n.templateFreeChoice1,
          l10n.templateFreeChoice2,
          l10n.templateFreeChoice3,
          l10n.templateFreeChoice4,
        ];
      default:
        return exampleChoices;
    }
  }

  List<String> getLocalizedPriorityChips(AppLocalizations l10n) {
    switch (id) {
      case 'career':
        return [
          l10n.templateCareerPriority1,
          l10n.templateCareerPriority1_2,
          l10n.templateCareerPriority2,
          l10n.templateCareerPriority3,
          l10n.templateCareerPriority4,
          l10n.templateCareerPriority4_2,
          l10n.templateCareerPriority5,
          l10n.templateCareerPriority6,
        ];
      case 'finance':
        return [
          l10n.templateFinancePriority1,
          l10n.templateFinancePriority2,
          l10n.templateFinancePriority2_2,
          l10n.templateFinancePriority3,
          l10n.templateFinancePriority4,
          l10n.templateFinancePriority4_2,
          l10n.templateFinancePriority5,
          l10n.templateFinancePriority6,
        ];
      case 'relationship':
        return [
          l10n.templateRelationshipPriority1,
          l10n.templateRelationshipPriority2,
          l10n.templateRelationshipPriority3,
          l10n.templateRelationshipPriority4,
          l10n.templateRelationshipPriority5,
          l10n.templateRelationshipPriority6,
          l10n.templateRelationshipPriority7,
        ];
      case 'lifestyle':
        return [
          l10n.templateLifestylePriority1,
          l10n.templateLifestylePriority2,
          l10n.templateLifestylePriority3,
          l10n.templateLifestylePriority3_2,
          l10n.templateLifestylePriority4,
          l10n.templateLifestylePriority5,
        ];
      case 'free':
        return [
          l10n.templateFreePriority1,
          l10n.templateFreePriority2,
          l10n.templateFreePriority3,
          l10n.templateFreePriority4,
          l10n.templateFreePriority5,
          l10n.templateFreePriority6,
        ];
      default:
        return priorityChips;
    }
  }

  static const List<ConcernTemplate> templates = [
    ConcernTemplate(
      id: 'career',
      title: '진로/커리어',
      description: '직업, 이직, 진로 선택',
      icon: LucideIcons.briefcase,
      exampleTitle: 'A회사 vs B회사, 이직 고민',
      exampleDescription:
          'A회사는 연봉은 높지만 야근이 잦고, B회사는 워라밸은 보장되지만 성장이 정체될 것 같아 고민입니다. 현재 회사에 남는 선택지도 고려 중입니다.',
      exampleChoices: [
        '연봉이 높은 A사로 이직한다.',
        '워라밸이 좋은 B사로 이직한다.',
        '집 가까운 C사로 이직한다.',
        '현 직장에 남아서 새로운 기회를 모색한다.',
      ],
      priorityChips: ['연봉 및 보상', '워라밸', '성장 가능성', '흥미 및 성취감', '조직 문화 및 동료'],
    ),
    ConcernTemplate(
      id: 'finance',
      title: '소비/재테크',
      description: '구매, 투자, 소비 결정',
      icon: LucideIcons.wallet,
      exampleTitle: '신형 노트북, 지금 사는 게 맞을까?',
      exampleDescription:
          '지금 쓰는 노트북도 아직 쓸만하지만, 새로 나온 모델의 성능과 디자인이 마음에 들어서 바꾸고 싶어요. 하지만 꽤 큰 지출이라 망설여집니다.',
      exampleChoices: [
        '할부로 신형 노트북을 구매한다.',
        '1년 더 참고 기존 노트북을 사용한다.',
        '대안으로 중고 모델을 알아본다.',
        '사지 않는다.',
      ],
      priorityChips: ['가성비', '만족감 및 욕구 충족', '미래 가치', '실용성 및 필요성', '안정성 및 리스크'],
    ),
    ConcernTemplate(
      id: 'relationship',
      title: '인간관계',
      description: '친구, 가족, 연인 관계',
      icon: LucideIcons.users,
      exampleTitle: '친구의 부탁, 어떻게 거절해야 할까?',
      exampleDescription:
          '친한 친구가 무리한 부탁을 했는데, 들어주기엔 제가 너무 힘들 것 같아요. 거절하면 친구와의 사이가 멀어질까 봐 걱정됩니다.',
      exampleChoices: [
        '솔직하게 내 상황을 이야기하고 거절한다.',
        '힘들지만 이번 한 번만 친구의 부탁을 들어준다.',
        '대안을 제시하며 부탁의 일부만 들어준다.',
        '나도 다른 제안을 한다.',
      ],
      priorityChips: ['나의 감정', '상대방의 감정', '관계의 지속성', '솔직함 및 명확성', '갈등 회피'],
    ),
    ConcernTemplate(
      id: 'lifestyle',
      title: '일상/습관',
      description: '운동, 학습, 생활 패턴',
      icon: LucideIcons.dumbbell,
      exampleTitle: '아침 운동 vs 저녁 운동',
      exampleDescription:
          '건강을 위해 운동을 시작하려고 합니다. 아침에 하면 하루가 개운할 것 같지만, 저녁 약속이 자유로운 저녁 운동도 포기하기 어렵습니다.',
      exampleChoices: [
        '30분 일찍 일어나 아침 운동을 한다.',
        '퇴근 후 저녁 시간을 활용해 운동한다.',
        '주 2회는 아침, 주 2회는 저녁에 운동한다.',
        '운동을 하지 않는다.',
      ],
      priorityChips: ['건강', '시간 효율', '의지력 및 실천 가능성', '즐거움', '장기적 이득'],
    ),
    ConcernTemplate(
      id: 'free',
      title: '자유 형식',
      description: '자유롭게 고민 작성',
      icon: LucideIcons.sparkles,
      exampleTitle: '주말에 뭐 할까?',
      exampleDescription: '쉬고 싶기도 하고, 친구들을 만나서 놀고 싶기도 해요.',
      exampleChoices: ['집에서 영화 보며 휴식하기', '친구들과 만나서 저녁 먹기', '서점에 가기', '운동 가기'],
      priorityChips: ['만족도', '비용', '시간', '스트레스', '장기적 이득', '노력'],
    ),
  ];
}
