// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'Choicely';

  @override
  String get appTitle => '고민 해결을 위한 직관과 논리 분석';

  @override
  String get concernList => '고민 목록';

  @override
  String get concernDetail => '고민 상세';

  @override
  String get addConcern => '새로운 고민';

  @override
  String get deleteConcern => '고민 삭제';

  @override
  String get deleteConcernMessage => '이 고민을 삭제하시겠습니까?\n삭제된 고민은 복구할 수 없습니다.';

  @override
  String get cancel => '취소';

  @override
  String get delete => '삭제';

  @override
  String get confirm => '확인';

  @override
  String get noConcerns => '고민이 없습니다';

  @override
  String get addNewConcern => '새로운 고민을 추가해보세요';

  @override
  String get addConcernButton => '고민 추가';

  @override
  String get errorOccurred => '오류가 발생했습니다';

  @override
  String get whatIsYourConcern => '무엇이 고민이신가요?';

  @override
  String get solveConcernDeeply => '심층적으로 고민을 해결해 보세요.';

  @override
  String get concernTitle => '고민 제목';

  @override
  String get concernTitleHint => '예: A회사와 B회사 중 어디로 갈까?';

  @override
  String get titleRequired => '제목을 입력해주세요';

  @override
  String get description => '상세 설명';

  @override
  String get descriptionHint => '고민에 대해 자세히 설명해주세요';

  @override
  String get descriptionRequired => '설명을 입력해주세요';

  @override
  String get analysisMethod => '분석 방법 선택';

  @override
  String get logicalAnalysis => '논리';

  @override
  String get logicalAnalysisDesc => '가치관을 설정하고 점수를 매겨 객관적으로 비교해보세요';

  @override
  String get intuitiveAnalysis => '직관 분석';

  @override
  String get intuitiveAnalysisDesc => '타로카드를 통해 내면의 소리를 들어보세요';

  @override
  String get finalChoice => '선택지 최종 선택';

  @override
  String get makeFinalDecision => '최종 결정하기';

  @override
  String get completed => '완료';

  @override
  String get recommendedChoice => '추천 선택';

  @override
  String get score => '점수';

  @override
  String get tarotCardResult => '타로 카드 결과';

  @override
  String cardNumber(Object number) {
    return '카드 $number';
  }

  @override
  String get finalDecisionConfirm => '최종 결정 확인';

  @override
  String choiceLabel(Object index) {
    return '$index번 선택지';
  }

  @override
  String get analysisComplete => '분석 완료';

  @override
  String get tarotCardAnalysis => '타로 카드 분석';

  @override
  String get tarotCardAnalysisDesc => '각 선택지마다 운명의 메시지를 받아보세요.';

  @override
  String get checkDestinyForChoice => '이 선택지의 운명을 확인해 보세요.';

  @override
  String get drawTarotCard => '타로 카드 뽑기';

  @override
  String get destinyCardSelection => '운명의 카드 뽑기';

  @override
  String get selectCardYouLike => '마음에 드는 카드 한 장을 선택해주세요';

  @override
  String get viewCardResult => '카드 결과 보기';

  @override
  String get selectChoice => '선택지 선택하기';

  @override
  String get inProgress => '진행중';

  @override
  String get scheduled => '진행 예정';

  @override
  String get logical => '논리';

  @override
  String get intuitive => '직관';

  @override
  String get resolved => '해결';

  @override
  String get archived => '보관';

  @override
  String get selectComparisonItems => '비교할 항목을 선택하세요';

  @override
  String get selectImportantValues => '중요하게 생각하는 가치관을 선택해주세요';

  @override
  String get addCustomItem => '직접 입력';

  @override
  String get recommendedItems => '추천 항목';

  @override
  String get tarotMessage1 => '새로운 시작과 기회가 다가오고 있습니다. 용기를 내어 첫 걸음을 내딛어보세요.';

  @override
  String get tarotMessage2 => '균형과 조화를 추구하는 시기입니다. 상대방의 의견도 귀담아들어보세요.';

  @override
  String get tarotMessage3 => '창의성과 표현력이 빛나는 때입니다. 자신만의 독특한 방식으로 접근해보세요.';

  @override
  String get tarotMessage4 => '안정과 기반을 다지는 시기입니다. 꾸준한 노력이 결실을 맺을 것입니다.';

  @override
  String get tarotMessage5 => '변화와 도전이 기다리고 있습니다. 새로운 시도를 두려워하지 마세요.';

  @override
  String get tarotMessage6 => '조화와 균형을 통해 문제를 해결할 수 있습니다. 타협점을 찾아보세요.';

  @override
  String get tarotMessage7 => '내면의 지혜와 직감을 믿으세요. 조급해하지 말고 신중하게 판단하세요.';

  @override
  String get tarotMessage8 => '결단력과 행동력이 필요한 시기입니다. 망설이지 말고 실행에 옮기세요.';

  @override
  String get tarotMessage9 => '완성과 성취의 시기입니다. 지금까지의 노력이 인정받을 것입니다.';

  @override
  String get tarotMessage10 => '새로운 순환의 시작입니다. 과거를 정리하고 미래를 향해 나아가세요.';

  @override
  String get destinyMessage => '운명의 메시지를 받아보세요.';

  @override
  String get career => '진로/커리어';

  @override
  String get careerDesc => '직업, 이직, 진로 선택';

  @override
  String get careerExample => 'A회사 vs B회사, 이직 고민';

  @override
  String get careerExampleDesc =>
      'A회사는 연봉은 높지만 야근이 잦고, B회사는 워라밸은 보장되지만 성장이 정체될 것 같아 고민입니다. 현재 회사에 남는 선택지도 고려 중입니다.';

  @override
  String get careerChoice1 => '연봉이 높은 A사로 이직한다.';

  @override
  String get careerChoice2 => '워라밸이 좋은 B사로 이직한다.';

  @override
  String get careerChoice3 => '집 가까운 C사로 이직한다.';

  @override
  String get careerChoice4 => '현 직장에 남아서 새로운 기회를 모색한다.';

  @override
  String get careerPriority1 => '연봉 및 보상';

  @override
  String get careerPriority2 => '워라밸';

  @override
  String get careerPriority3 => '성장 가능성';

  @override
  String get careerPriority4 => '흥미 및 성취감';

  @override
  String get careerPriority5 => '조직 문화 및 동료';

  @override
  String get concernAdded => '고민이 추가되었습니다';

  @override
  String get optionSetting => '선택지 설정';

  @override
  String get howManyOptions => '몇 가지 선택지를 두고 고민 중이신가요?';

  @override
  String numberOfOptions(Object number) {
    return '$number개';
  }

  @override
  String optionLabel(Object label) {
    return '선택지 $label';
  }

  @override
  String get optionHint1 => '첫 번째 선택지를 입력하세요';

  @override
  String get optionHint2 => '두 번째 선택지를 입력하세요';

  @override
  String get optionHint3 => '세 번째 선택지를 입력하세요';

  @override
  String get optionHint4 => '네 번째 선택지를 입력하세요';

  @override
  String get templateSelection => '템플릿 선택';

  @override
  String get templateSelectionDesc => '어떤 종류의 고민인지 선택해주세요.';

  @override
  String get createConcern => '고민 만들기';

  @override
  String get selectTemplate => '템플릿을 선택하세요';

  @override
  String get proceed => '진행하기';

  @override
  String get templateCareerTitle => '진로/커리어';

  @override
  String get templateCareerDesc => '직업, 이직, 진로 선택';

  @override
  String get templateCareerExample => 'A회사 vs B회사, 이직 고민';

  @override
  String get templateCareerExampleDesc =>
      'A회사는 연봉은 높지만 야근이 잦고, B회사는 워라밸은 보장되지만 성장이 정체될 것 같아 고민입니다. 현재 회사에 남는 선택지도 고려 중입니다.';

  @override
  String get templateCareerChoice1 => '연봉이 높은 A사로 이직한다.';

  @override
  String get templateCareerChoice2 => '워라밸이 좋은 B사로 이직한다.';

  @override
  String get templateCareerChoice3 => '집 가까운 C사로 이직한다.';

  @override
  String get templateCareerChoice4 => '현 직장에 남아서 새로운 기회를 모색한다.';

  @override
  String get templateCareerPriority1 => '연봉';

  @override
  String get templateCareerPriority1_2 => '보상';

  @override
  String get templateCareerPriority2 => '워라밸';

  @override
  String get templateCareerPriority3 => '성장 가능성';

  @override
  String get templateCareerPriority4 => '흥미';

  @override
  String get templateCareerPriority4_2 => '성취감';

  @override
  String get templateCareerPriority5 => '조직 문화';

  @override
  String get templateCareerPriority6 => '동료';

  @override
  String get templateFinanceTitle => '소비/재테크';

  @override
  String get templateFinanceDesc => '구매, 투자, 소비 결정';

  @override
  String get templateFinanceExample => '신형 노트북, 지금 사는 게 맞을까?';

  @override
  String get templateFinanceExampleDesc =>
      '지금 쓰는 노트북도 아직 쓸만하지만, 새로 나온 모델의 성능과 디자인이 마음에 들어서 바꾸고 싶어요. 하지만 꽤 큰 지출이라 망설여집니다.';

  @override
  String get templateFinanceChoice1 => '할부로 신형 노트북을 구매한다.';

  @override
  String get templateFinanceChoice2 => '1년 더 참고 기존 노트북을 사용한다.';

  @override
  String get templateFinanceChoice3 => '대안으로 중고 모델을 알아본다.';

  @override
  String get templateFinanceChoice4 => '사지 않는다.';

  @override
  String get templateFinancePriority1 => '가성비';

  @override
  String get templateFinancePriority2 => '만족감';

  @override
  String get templateFinancePriority2_2 => '욕구 충족';

  @override
  String get templateFinancePriority3 => '미래 가치';

  @override
  String get templateFinancePriority4 => '실용성';

  @override
  String get templateFinancePriority4_2 => '필요성';

  @override
  String get templateFinancePriority5 => '안정성';

  @override
  String get templateFinancePriority6 => '리스크';

  @override
  String get templateRelationshipTitle => '인간관계';

  @override
  String get templateRelationshipDesc => '친구, 가족, 연인 관계';

  @override
  String get templateRelationshipExample => '친구의 부탁, 어떻게 거절해야 할까?';

  @override
  String get templateRelationshipExampleDesc =>
      '친한 친구가 무리한 부탁을 했는데, 들어주기엔 제가 너무 힘들 것 같아요. 거절하면 친구와의 사이가 멀어질까 봐 걱정됩니다.';

  @override
  String get templateRelationshipChoice1 => '솔직하게 내 상황을 이야기하고 거절한다.';

  @override
  String get templateRelationshipChoice2 => '힘들지만 이번 한 번만 친구의 부탁을 들어준다.';

  @override
  String get templateRelationshipChoice3 => '대안을 제시하며 부탁의 일부만 들어준다.';

  @override
  String get templateRelationshipChoice4 => '나도 다른 제안을 한다.';

  @override
  String get templateRelationshipPriority1 => '나의 감정';

  @override
  String get templateRelationshipPriority2 => '상대방의 감정';

  @override
  String get templateRelationshipPriority3 => '관계의 지속성';

  @override
  String get templateRelationshipPriority4 => '솔직함 및 명확성';

  @override
  String get templateRelationshipPriority5 => '갈등 회피';

  @override
  String get templateRelationshipPriority6 => '솔직함';

  @override
  String get templateRelationshipPriority7 => '명확성';

  @override
  String get templateLifestyleTitle => '일상/습관';

  @override
  String get templateLifestyleDesc => '운동, 학습, 생활 패턴';

  @override
  String get templateLifestyleExample => '아침 운동 vs 저녁 운동';

  @override
  String get templateLifestyleExampleDesc =>
      '건강을 위해 운동을 시작하려고 합니다. 아침에 하면 하루가 개운할 것 같지만, 저녁 약속이 자유로운 저녁 운동도 포기하기 어렵습니다.';

  @override
  String get templateLifestyleChoice1 => '30분 일찍 일어나 아침 운동을 한다.';

  @override
  String get templateLifestyleChoice2 => '퇴근 후 저녁 시간을 활용해 운동한다.';

  @override
  String get templateLifestyleChoice3 => '주 2회는 아침, 주 2회는 저녁에 운동한다.';

  @override
  String get templateLifestyleChoice4 => '운동을 하지 않는다.';

  @override
  String get templateLifestylePriority1 => '건강';

  @override
  String get templateLifestylePriority2 => '시간 효율';

  @override
  String get templateLifestylePriority3 => '의지력';

  @override
  String get templateLifestylePriority3_2 => '실천 가능성';

  @override
  String get templateLifestylePriority4 => '즐거움';

  @override
  String get templateLifestylePriority5 => '장기적 이득';

  @override
  String get templateFreeTitle => '자유 형식';

  @override
  String get templateFreeDesc => '자유롭게 고민 작성';

  @override
  String get templateFreeExample => '주말에 뭐 할까?';

  @override
  String get templateFreeExampleDesc => '쉬고 싶기도 하고, 친구들을 만나서 놀고 싶기도 해요.';

  @override
  String get templateFreeChoice1 => '집에서 영화 보며 휴식하기';

  @override
  String get templateFreeChoice2 => '친구들과 만나서 저녁 먹기';

  @override
  String get templateFreeChoice3 => '서점에 가기';

  @override
  String get templateFreeChoice4 => '운동 가기';

  @override
  String get templateFreePriority1 => '만족도';

  @override
  String get templateFreePriority2 => '비용';

  @override
  String get templateFreePriority3 => '시간';

  @override
  String get templateFreePriority4 => '스트레스';

  @override
  String get templateFreePriority5 => '장기적 이득';

  @override
  String get templateFreePriority6 => '노력';

  @override
  String get statusInProgress => '진행중';

  @override
  String get statusResolved => '해결';

  @override
  String get statusArchived => '보관';

  @override
  String get selectedChoice => '선택';

  @override
  String get analysisMethodSelection => '분석 방법 선택';

  @override
  String get logicalAnalysisTitle => '논리 분석';

  @override
  String get logicalAnalysisSubtitle => '가치관을 설정하고 점수를 매겨 객관적으로 비교해보세요';

  @override
  String get intuitiveAnalysisTitle => '직관 분석';

  @override
  String get intuitiveAnalysisSubtitle => '타로카드를 통해 내면의 소리를 들어보세요';

  @override
  String get finalChoiceSelection => '선택지 최종 선택';

  @override
  String get finalDecisionConfirmation => '최종 결정 확인';

  @override
  String finalDecisionMessage(Object choice, Object description) {
    return '\'$choice: $description\'(으)로 결정을 완료하시겠어요?';
  }

  @override
  String get comparisonItemSetup => '비교 항목 설정';

  @override
  String get addComparisonItem => '비교 항목 추가';

  @override
  String get comparisonItemNameHint => '비교 항목 이름을 입력하세요';

  @override
  String get add => '추가';

  @override
  String get selectedItems => '선택된 항목';

  @override
  String get next => '다음';

  @override
  String get scoring => '점수 매기기';

  @override
  String get frameworkNotFound => '프레임워크를 찾을 수 없습니다';

  @override
  String get noChoices => '선택지가 없습니다';

  @override
  String get weightSettings => '가중치 설정';

  @override
  String get weightSettingsDesc => '각 항목의 중요도를 1-10 사이로 설정해주세요';

  @override
  String get low => '낮음';

  @override
  String get high => '높음';

  @override
  String get scoringDesc => '각 항목별로 선택지의 점수를 매겨주세요 (1-10)';

  @override
  String get weight => '가중치';

  @override
  String get viewResults => '결과 보기';

  @override
  String get analysisResult => '분석 결과';

  @override
  String get tie => '동점입니다!';

  @override
  String get tieDescription => '여러 선택지가 비슷한 점수를 받았습니다';

  @override
  String get totalScoreComparison => '총점 비교';

  @override
  String get points => '점';

  @override
  String get detailedAnalysis => '상세 분석';

  @override
  String get language => '언어';

  @override
  String get korean => '한국어';

  @override
  String get english => 'English';

  @override
  String get oracleCard1Name => '탄생';

  @override
  String get oracleCard1Text => 'YES';

  @override
  String get oracleCard1Percentage => '100%';

  @override
  String get oracleCard1Description =>
      '태양의 가호를 받은 태양 카드는 모든 일의 출발과 시작입니다. 될 일은 결코 이루어집니다.';

  @override
  String get oracleCard2Name => '상승';

  @override
  String get oracleCard2Text => 'YES';

  @override
  String get oracleCard2Percentage => '100%';

  @override
  String get oracleCard2Description => '위로 올라가는 상승 카드는 하는 일에 승리가 따를 것을 보여줍니다.';

  @override
  String get oracleCard3Name => '명예';

  @override
  String get oracleCard3Text => 'YES';

  @override
  String get oracleCard3Percentage => '100%';

  @override
  String get oracleCard3Description =>
      '명예 카드는 질문이 곧 나의 명예를 상승시켜 줄 수 있음을 보여줍니다.';

  @override
  String get oracleCard4Name => '리더쉽';

  @override
  String get oracleCard4Text => 'YES';

  @override
  String get oracleCard4Percentage => '84%';

  @override
  String get oracleCard4Description =>
      '리더쉽 카드는 나의 자리가 견고함을 보여줍니다. 질문이 긍정적인 방향으로 갈 것을 알려줍니다.';

  @override
  String get oracleCard5Name => '우울';

  @override
  String get oracleCard5Text => 'NO';

  @override
  String get oracleCard5Percentage => '73%';

  @override
  String get oracleCard5Description =>
      '우울 카드는 고민이 많아지는 것을 보여줍니다. 질문의 방향이 좋지 않은 쪽으로 흘러갈 가능성이 있습니다.';

  @override
  String get oracleCard6Name => '변덕/불안정';

  @override
  String get oracleCard6Text => 'NO';

  @override
  String get oracleCard6Percentage => '86%';

  @override
  String get oracleCard6Description =>
      '변덕 카드는 불안정한 상태를 보여줍니다. 질문의 미래가 불투명해질 수 있습니다.';

  @override
  String get oracleCard7Name => '가족';

  @override
  String get oracleCard7Text => 'YES';

  @override
  String get oracleCard7Percentage => '80%';

  @override
  String get oracleCard7Description =>
      '가족 카드는 든든한 울타리 안에 있음을 보여줍니다. 질문의 미래가 안정적이라고 볼 수 있습니다.';

  @override
  String get oracleCard8Name => '엄마';

  @override
  String get oracleCard8Text => 'YES';

  @override
  String get oracleCard8Percentage => '90%';

  @override
  String get oracleCard8Description =>
      '엄마 카드는 언제나 따뜻하게 품어주는 엄마와 같습니다. 질문이 긍정적인 방향으로 흘러갈 수 있습니다.';

  @override
  String get oracleCard9Name => '질병';

  @override
  String get oracleCard9Text => 'NO';

  @override
  String get oracleCard9Percentage => '94%';

  @override
  String get oracleCard9Description =>
      '질병 카드는 뜻과 같이 일이 진행되지 않음을 보여줍니다. 결과가 좋지 않을 수 있습니다.';

  @override
  String get oracleCard10Name => '변화';

  @override
  String get oracleCard10Text => 'NO';

  @override
  String get oracleCard10Percentage => '56%';

  @override
  String get oracleCard10Description =>
      '변화 카드는 변화를 암시합니다. 변화는 잘 대응하면 긍정적이지만 대체로 부정적입니다.';

  @override
  String get oracleCard11Name => '지성';

  @override
  String get oracleCard11Text => 'YES';

  @override
  String get oracleCard11Percentage => '73%';

  @override
  String get oracleCard11Description =>
      '지성 카드는 꽤 긍정적입니다. 지성을 발휘하여 문제를 해결해 나갈 수 있습니다.';

  @override
  String get oracleCard12Name => '도둑질';

  @override
  String get oracleCard12Text => 'NO';

  @override
  String get oracleCard12Percentage => '95%';

  @override
  String get oracleCard12Description =>
      '도둑질 카드는 부정적인 카드입니다. 내 생각과 다르게 타인의 부정 행위에 의해 좌절될 수 있습니다.';

  @override
  String get oracleCard13Name => '거래';

  @override
  String get oracleCard13Text => 'YES';

  @override
  String get oracleCard13Percentage => '64%';

  @override
  String get oracleCard13Description =>
      '트레이드 카드는 꽤 긍정적입니다. 협상이 발생할 수 있지만 긍정적인 쪽으로 타협할 수 있습니다.';

  @override
  String get oracleCard14Name => '즐거움';

  @override
  String get oracleCard14Text => 'YES';

  @override
  String get oracleCard14Percentage => '82%';

  @override
  String get oracleCard14Description =>
      '즐거움 카드는 상당히 긍정적입니다. 결과가 어찌되든 자신이 느끼는 행복과 즐거움이 따릅니다.';

  @override
  String get oracleCard15Name => '평화';

  @override
  String get oracleCard15Text => 'YES';

  @override
  String get oracleCard15Percentage => '100%';

  @override
  String get oracleCard15Description =>
      '평화 카드는 무척 긍정적입니다. 결과는 결국 긍정적인 방향으로 종결되고 평화가 찾아올 것입니다.';

  @override
  String get oracleCard16Name => '돈';

  @override
  String get oracleCard16Text => 'YES';

  @override
  String get oracleCard16Percentage => '88%';

  @override
  String get oracleCard16Description =>
      '돈 카드는 긍정에 가깝습니다. 금전적으로 해결되는 일, 혹은 금전이 되어 돌아오는 일 생길 수 있습니다.';

  @override
  String get oracleCard17Name => '사랑';

  @override
  String get oracleCard17Text => 'YES';

  @override
  String get oracleCard17Percentage => '100%';

  @override
  String get oracleCard17Description =>
      '사랑 카드는 긍정입니다. 연애와 관련한 질문이었다면 결국 사랑의 화합으로 이어질 것입니다.';

  @override
  String get oracleCard18Name => '음식과 음료';

  @override
  String get oracleCard18Text => 'YES';

  @override
  String get oracleCard18Percentage => '88%';

  @override
  String get oracleCard18Description =>
      '음식과 음료 카드는 긍정입니다. 맛있는걸 먹고 마시며 즐거운 시간으로 이어질 것입니다.';

  @override
  String get oracleCard19Name => '악의';

  @override
  String get oracleCard19Text => 'NO';

  @override
  String get oracleCard19Percentage => '100%';

  @override
  String get oracleCard19Description =>
      '악의 카드는 부정적입니다. 내 뜻과 달리 타인의 개입이나 악의로 인해 좌절될 수 있습니다.';

  @override
  String get oracleCard20Name => '전쟁';

  @override
  String get oracleCard20Text => 'NO';

  @override
  String get oracleCard20Percentage => '100%';

  @override
  String get oracleCard20Description =>
      '전쟁 카드는 부정적입니다. 서로 충돌하고 싸우고 오해하는 일이 생길 수 있습니다.';

  @override
  String get oracleCard21Name => '적';

  @override
  String get oracleCard21Text => 'NO';

  @override
  String get oracleCard21Percentage => '100%';

  @override
  String get oracleCard21Description =>
      '적 카드는 부정적입니다. 나를 해치고 음해하는 적이 가까운 곳에 있을 수 있습니다.';

  @override
  String get oracleCard22Name => '불/재난';

  @override
  String get oracleCard22Text => 'NO';

  @override
  String get oracleCard22Percentage => '100%';

  @override
  String get oracleCard22Description =>
      '재난 카드는 부정적입니다. 내 뜻과 다른 재해와 가까운 외부 변수로 인해 좌절될 수 있습니다.';

  @override
  String get oracleCard23Name => '사고';

  @override
  String get oracleCard23Text => 'NO';

  @override
  String get oracleCard23Percentage => '100%';

  @override
  String get oracleCard23Description => '사고 카드는 부정적입니다. 갑작스러운 이슈가 생길 수 있습니다.';

  @override
  String get oracleCard24Name => '지원/후원';

  @override
  String get oracleCard24Text => 'YES';

  @override
  String get oracleCard24Percentage => '70%';

  @override
  String get oracleCard24Description =>
      '성찰 카드는 긍정적입니다. 자아 성찰을 통해 더 나은 미래로 나아갈 수 있습니다.';

  @override
  String get oracleCard25Name => '좋은 기회';

  @override
  String get oracleCard25Text => 'YES';

  @override
  String get oracleCard25Percentage => '100%';

  @override
  String get oracleCard25Description =>
      '좋은 기회 카드는 무척 긍정적입니다. 생각하지 못한 좋은 기회가 가까운 곳에서 기다리고 있을 수 있습니다.';

  @override
  String get oracleCard26Name => '명성';

  @override
  String get oracleCard26Text => 'YES';

  @override
  String get oracleCard26Percentage => '100%';

  @override
  String get oracleCard26Description =>
      '명성 카드는 무척 긍정적입니다. 주변에 나의 좋은 소식, 명성이 올라가는 긍정적인 이벤트가 있을 수 있습니다.';

  @override
  String get oracleCard27Name => '불운';

  @override
  String get oracleCard27Text => 'NO';

  @override
  String get oracleCard27Percentage => '100%';

  @override
  String get oracleCard27Description =>
      '불운 카드는 부정적입니다. 내 실수나 잘못을 떠나서 찾아오는 불운이 생길 수 있습니다.';

  @override
  String get oracleCard28Name => '비극';

  @override
  String get oracleCard28Text => 'NO';

  @override
  String get oracleCard28Percentage => '100%';

  @override
  String get oracleCard28Description =>
      '비극 카드는 부정적입니다. 이름에서 느껴지듯 비극적인 결론으로 이어질 수 있으니 주의가 필요합니다.';

  @override
  String get oracleCard29Name => '파멸';

  @override
  String get oracleCard29Text => 'NO';

  @override
  String get oracleCard29Percentage => '100%';

  @override
  String get oracleCard29Description =>
      '파멸 카드는 부정적입니다. 이름에서 느껴지듯 파멸로 향하며 끝날 수 있습니다.';

  @override
  String get oracleCard30Name => '지연/고통';

  @override
  String get oracleCard30Text => 'NO';

  @override
  String get oracleCard30Percentage => '60%';

  @override
  String get oracleCard30Description =>
      '지연 카드는 꽤 부정적입니다. 일의 지연과 막힘이 있을 수 있습니다.';

  @override
  String get oracleCard31Name => '고립';

  @override
  String get oracleCard31Text => 'NO';

  @override
  String get oracleCard31Percentage => '70%';

  @override
  String get oracleCard31Description =>
      '고립 카드는 꽤 부정적입니다. 혼자 고립되어 외롭고 고독한 시간을 보낼 수 있습니다.';

  @override
  String get oracleCard32Name => '대화/유머';

  @override
  String get oracleCard32Text => 'YES';

  @override
  String get oracleCard32Percentage => '80%';

  @override
  String get oracleCard32Description =>
      '유머 카드는 꽤 긍정적입니다. 누군가와 즐겁게 대화하고 웃을 수 있는 시간이 있을 수 있습니다.';

  @override
  String get oracleCard33Name => '지혜';

  @override
  String get oracleCard33Text => 'YES';

  @override
  String get oracleCard33Percentage => '89%';

  @override
  String get oracleCard33Description =>
      '지혜 카드는 지혜로 어려움이나 난관을 헤쳐나갈 수 있음을 보여줍니다. 긍정적입니다.';

  @override
  String get oracleCard34Name => '행복';

  @override
  String get oracleCard34Text => 'YES';

  @override
  String get oracleCard34Percentage => '100%';

  @override
  String get oracleCard34Description =>
      '행복 카드는 곧 행복의 감정이 찾아올 것을 보여줍니다. 행복은 멀리 있지 않습니다.';

  @override
  String get oracleCard35Name => '건강한 가치관';

  @override
  String get oracleCard35Text => 'YES';

  @override
  String get oracleCard35Percentage => '84%';

  @override
  String get oracleCard35Description =>
      '마음 깊이 자리 잡은 건강한 가치관으로 어려움을 이겨내고 극복할 수 있음을 보여줍니다. 무척 긍정적입니다.';
}
