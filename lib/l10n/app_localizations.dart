import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko'),
  ];

  /// No description provided for @appName.
  ///
  /// In ko, this message translates to:
  /// **'Choicely'**
  String get appName;

  /// No description provided for @appTitle.
  ///
  /// In ko, this message translates to:
  /// **'고민 해결을 위한 직관과 논리 분석'**
  String get appTitle;

  /// No description provided for @concernList.
  ///
  /// In ko, this message translates to:
  /// **'고민 목록'**
  String get concernList;

  /// No description provided for @concernDetail.
  ///
  /// In ko, this message translates to:
  /// **'고민 상세'**
  String get concernDetail;

  /// No description provided for @addConcern.
  ///
  /// In ko, this message translates to:
  /// **'새로운 고민'**
  String get addConcern;

  /// No description provided for @deleteConcern.
  ///
  /// In ko, this message translates to:
  /// **'고민 삭제'**
  String get deleteConcern;

  /// No description provided for @deleteConcernMessage.
  ///
  /// In ko, this message translates to:
  /// **'이 고민을 삭제하시겠습니까?\n삭제된 고민은 복구할 수 없습니다.'**
  String get deleteConcernMessage;

  /// No description provided for @cancel.
  ///
  /// In ko, this message translates to:
  /// **'취소'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In ko, this message translates to:
  /// **'삭제'**
  String get delete;

  /// No description provided for @confirm.
  ///
  /// In ko, this message translates to:
  /// **'확인'**
  String get confirm;

  /// No description provided for @noConcerns.
  ///
  /// In ko, this message translates to:
  /// **'고민이 없습니다'**
  String get noConcerns;

  /// No description provided for @addNewConcern.
  ///
  /// In ko, this message translates to:
  /// **'새로운 고민을 추가해보세요'**
  String get addNewConcern;

  /// No description provided for @addConcernButton.
  ///
  /// In ko, this message translates to:
  /// **'고민 추가'**
  String get addConcernButton;

  /// No description provided for @errorOccurred.
  ///
  /// In ko, this message translates to:
  /// **'오류가 발생했습니다'**
  String get errorOccurred;

  /// No description provided for @whatIsYourConcern.
  ///
  /// In ko, this message translates to:
  /// **'무엇이 고민이신가요?'**
  String get whatIsYourConcern;

  /// No description provided for @solveConcernDeeply.
  ///
  /// In ko, this message translates to:
  /// **'심층적으로 고민을 해결해 보세요.'**
  String get solveConcernDeeply;

  /// No description provided for @concernTitle.
  ///
  /// In ko, this message translates to:
  /// **'고민 제목'**
  String get concernTitle;

  /// No description provided for @concernTitleHint.
  ///
  /// In ko, this message translates to:
  /// **'예: A회사와 B회사 중 어디로 갈까?'**
  String get concernTitleHint;

  /// No description provided for @titleRequired.
  ///
  /// In ko, this message translates to:
  /// **'제목을 입력해주세요'**
  String get titleRequired;

  /// No description provided for @description.
  ///
  /// In ko, this message translates to:
  /// **'상세 설명'**
  String get description;

  /// No description provided for @descriptionHint.
  ///
  /// In ko, this message translates to:
  /// **'고민에 대해 자세히 설명해주세요'**
  String get descriptionHint;

  /// No description provided for @descriptionRequired.
  ///
  /// In ko, this message translates to:
  /// **'설명을 입력해주세요'**
  String get descriptionRequired;

  /// No description provided for @analysisMethod.
  ///
  /// In ko, this message translates to:
  /// **'분석 방법 선택'**
  String get analysisMethod;

  /// No description provided for @logicalAnalysis.
  ///
  /// In ko, this message translates to:
  /// **'논리'**
  String get logicalAnalysis;

  /// No description provided for @logicalAnalysisDesc.
  ///
  /// In ko, this message translates to:
  /// **'가치관을 설정하고 점수를 매겨 객관적으로 비교해보세요'**
  String get logicalAnalysisDesc;

  /// No description provided for @intuitiveAnalysis.
  ///
  /// In ko, this message translates to:
  /// **'직관 분석'**
  String get intuitiveAnalysis;

  /// No description provided for @intuitiveAnalysisDesc.
  ///
  /// In ko, this message translates to:
  /// **'타로카드를 통해 내면의 소리를 들어보세요'**
  String get intuitiveAnalysisDesc;

  /// No description provided for @finalChoice.
  ///
  /// In ko, this message translates to:
  /// **'선택지 최종 선택'**
  String get finalChoice;

  /// No description provided for @makeFinalDecision.
  ///
  /// In ko, this message translates to:
  /// **'최종 결정하기'**
  String get makeFinalDecision;

  /// No description provided for @completed.
  ///
  /// In ko, this message translates to:
  /// **'완료'**
  String get completed;

  /// No description provided for @recommendedChoice.
  ///
  /// In ko, this message translates to:
  /// **'추천 선택'**
  String get recommendedChoice;

  /// No description provided for @score.
  ///
  /// In ko, this message translates to:
  /// **'점수'**
  String get score;

  /// No description provided for @tarotCardResult.
  ///
  /// In ko, this message translates to:
  /// **'타로 카드 결과'**
  String get tarotCardResult;

  /// No description provided for @cardNumber.
  ///
  /// In ko, this message translates to:
  /// **'카드 {number}'**
  String cardNumber(Object number);

  /// No description provided for @finalDecisionConfirm.
  ///
  /// In ko, this message translates to:
  /// **'최종 결정 확인'**
  String get finalDecisionConfirm;

  /// No description provided for @choiceLabel.
  ///
  /// In ko, this message translates to:
  /// **'{index}번 선택지'**
  String choiceLabel(Object index);

  /// No description provided for @analysisComplete.
  ///
  /// In ko, this message translates to:
  /// **'분석 완료'**
  String get analysisComplete;

  /// No description provided for @tarotCardAnalysis.
  ///
  /// In ko, this message translates to:
  /// **'타로 카드 분석'**
  String get tarotCardAnalysis;

  /// No description provided for @tarotCardAnalysisDesc.
  ///
  /// In ko, this message translates to:
  /// **'각 선택지마다 운명의 메시지를 받아보세요.'**
  String get tarotCardAnalysisDesc;

  /// No description provided for @checkDestinyForChoice.
  ///
  /// In ko, this message translates to:
  /// **'이 선택지의 운명을 확인해 보세요.'**
  String get checkDestinyForChoice;

  /// No description provided for @drawTarotCard.
  ///
  /// In ko, this message translates to:
  /// **'타로 카드 뽑기'**
  String get drawTarotCard;

  /// No description provided for @destinyCardSelection.
  ///
  /// In ko, this message translates to:
  /// **'운명의 카드 뽑기'**
  String get destinyCardSelection;

  /// No description provided for @selectCardYouLike.
  ///
  /// In ko, this message translates to:
  /// **'마음에 드는 카드 한 장을 선택해주세요'**
  String get selectCardYouLike;

  /// No description provided for @viewCardResult.
  ///
  /// In ko, this message translates to:
  /// **'카드 결과 보기'**
  String get viewCardResult;

  /// No description provided for @selectChoice.
  ///
  /// In ko, this message translates to:
  /// **'선택지 선택하기'**
  String get selectChoice;

  /// No description provided for @inProgress.
  ///
  /// In ko, this message translates to:
  /// **'진행중'**
  String get inProgress;

  /// No description provided for @scheduled.
  ///
  /// In ko, this message translates to:
  /// **'진행 예정'**
  String get scheduled;

  /// No description provided for @logical.
  ///
  /// In ko, this message translates to:
  /// **'논리'**
  String get logical;

  /// No description provided for @intuitive.
  ///
  /// In ko, this message translates to:
  /// **'직관'**
  String get intuitive;

  /// No description provided for @resolved.
  ///
  /// In ko, this message translates to:
  /// **'해결'**
  String get resolved;

  /// No description provided for @archived.
  ///
  /// In ko, this message translates to:
  /// **'보관'**
  String get archived;

  /// No description provided for @selectComparisonItems.
  ///
  /// In ko, this message translates to:
  /// **'비교할 항목을 선택하세요'**
  String get selectComparisonItems;

  /// No description provided for @selectImportantValues.
  ///
  /// In ko, this message translates to:
  /// **'중요하게 생각하는 가치관을 선택해주세요'**
  String get selectImportantValues;

  /// No description provided for @addCustomItem.
  ///
  /// In ko, this message translates to:
  /// **'직접 입력'**
  String get addCustomItem;

  /// No description provided for @recommendedItems.
  ///
  /// In ko, this message translates to:
  /// **'추천 항목'**
  String get recommendedItems;

  /// No description provided for @tarotMessage1.
  ///
  /// In ko, this message translates to:
  /// **'새로운 시작과 기회가 다가오고 있습니다. 용기를 내어 첫 걸음을 내딛어보세요.'**
  String get tarotMessage1;

  /// No description provided for @tarotMessage2.
  ///
  /// In ko, this message translates to:
  /// **'균형과 조화를 추구하는 시기입니다. 상대방의 의견도 귀담아들어보세요.'**
  String get tarotMessage2;

  /// No description provided for @tarotMessage3.
  ///
  /// In ko, this message translates to:
  /// **'창의성과 표현력이 빛나는 때입니다. 자신만의 독특한 방식으로 접근해보세요.'**
  String get tarotMessage3;

  /// No description provided for @tarotMessage4.
  ///
  /// In ko, this message translates to:
  /// **'안정과 기반을 다지는 시기입니다. 꾸준한 노력이 결실을 맺을 것입니다.'**
  String get tarotMessage4;

  /// No description provided for @tarotMessage5.
  ///
  /// In ko, this message translates to:
  /// **'변화와 도전이 기다리고 있습니다. 새로운 시도를 두려워하지 마세요.'**
  String get tarotMessage5;

  /// No description provided for @tarotMessage6.
  ///
  /// In ko, this message translates to:
  /// **'조화와 균형을 통해 문제를 해결할 수 있습니다. 타협점을 찾아보세요.'**
  String get tarotMessage6;

  /// No description provided for @tarotMessage7.
  ///
  /// In ko, this message translates to:
  /// **'내면의 지혜와 직감을 믿으세요. 조급해하지 말고 신중하게 판단하세요.'**
  String get tarotMessage7;

  /// No description provided for @tarotMessage8.
  ///
  /// In ko, this message translates to:
  /// **'결단력과 행동력이 필요한 시기입니다. 망설이지 말고 실행에 옮기세요.'**
  String get tarotMessage8;

  /// No description provided for @tarotMessage9.
  ///
  /// In ko, this message translates to:
  /// **'완성과 성취의 시기입니다. 지금까지의 노력이 인정받을 것입니다.'**
  String get tarotMessage9;

  /// No description provided for @tarotMessage10.
  ///
  /// In ko, this message translates to:
  /// **'새로운 순환의 시작입니다. 과거를 정리하고 미래를 향해 나아가세요.'**
  String get tarotMessage10;

  /// No description provided for @destinyMessage.
  ///
  /// In ko, this message translates to:
  /// **'운명의 메시지를 받아보세요.'**
  String get destinyMessage;

  /// No description provided for @career.
  ///
  /// In ko, this message translates to:
  /// **'진로/커리어'**
  String get career;

  /// No description provided for @careerDesc.
  ///
  /// In ko, this message translates to:
  /// **'직업, 이직, 진로 선택'**
  String get careerDesc;

  /// No description provided for @careerExample.
  ///
  /// In ko, this message translates to:
  /// **'A회사 vs B회사, 이직 고민'**
  String get careerExample;

  /// No description provided for @careerExampleDesc.
  ///
  /// In ko, this message translates to:
  /// **'A회사는 연봉은 높지만 야근이 잦고, B회사는 워라밸은 보장되지만 성장이 정체될 것 같아 고민입니다. 현재 회사에 남는 선택지도 고려 중입니다.'**
  String get careerExampleDesc;

  /// No description provided for @careerChoice1.
  ///
  /// In ko, this message translates to:
  /// **'연봉이 높은 A사로 이직한다.'**
  String get careerChoice1;

  /// No description provided for @careerChoice2.
  ///
  /// In ko, this message translates to:
  /// **'워라밸이 좋은 B사로 이직한다.'**
  String get careerChoice2;

  /// No description provided for @careerChoice3.
  ///
  /// In ko, this message translates to:
  /// **'집 가까운 C사로 이직한다.'**
  String get careerChoice3;

  /// No description provided for @careerChoice4.
  ///
  /// In ko, this message translates to:
  /// **'현 직장에 남아서 새로운 기회를 모색한다.'**
  String get careerChoice4;

  /// No description provided for @careerPriority1.
  ///
  /// In ko, this message translates to:
  /// **'연봉 및 보상'**
  String get careerPriority1;

  /// No description provided for @careerPriority2.
  ///
  /// In ko, this message translates to:
  /// **'워라밸'**
  String get careerPriority2;

  /// No description provided for @careerPriority3.
  ///
  /// In ko, this message translates to:
  /// **'성장 가능성'**
  String get careerPriority3;

  /// No description provided for @careerPriority4.
  ///
  /// In ko, this message translates to:
  /// **'흥미 및 성취감'**
  String get careerPriority4;

  /// No description provided for @careerPriority5.
  ///
  /// In ko, this message translates to:
  /// **'조직 문화 및 동료'**
  String get careerPriority5;

  /// No description provided for @concernAdded.
  ///
  /// In ko, this message translates to:
  /// **'고민이 추가되었습니다'**
  String get concernAdded;

  /// No description provided for @optionSetting.
  ///
  /// In ko, this message translates to:
  /// **'선택지 설정'**
  String get optionSetting;

  /// No description provided for @howManyOptions.
  ///
  /// In ko, this message translates to:
  /// **'몇 가지 선택지를 두고 고민 중이신가요?'**
  String get howManyOptions;

  /// No description provided for @numberOfOptions.
  ///
  /// In ko, this message translates to:
  /// **'{number}개'**
  String numberOfOptions(Object number);

  /// No description provided for @optionLabel.
  ///
  /// In ko, this message translates to:
  /// **'선택지 {label}'**
  String optionLabel(Object label);

  /// No description provided for @optionHint1.
  ///
  /// In ko, this message translates to:
  /// **'첫 번째 선택지를 입력하세요'**
  String get optionHint1;

  /// No description provided for @optionHint2.
  ///
  /// In ko, this message translates to:
  /// **'두 번째 선택지를 입력하세요'**
  String get optionHint2;

  /// No description provided for @optionHint3.
  ///
  /// In ko, this message translates to:
  /// **'세 번째 선택지를 입력하세요'**
  String get optionHint3;

  /// No description provided for @optionHint4.
  ///
  /// In ko, this message translates to:
  /// **'네 번째 선택지를 입력하세요'**
  String get optionHint4;

  /// No description provided for @templateSelection.
  ///
  /// In ko, this message translates to:
  /// **'템플릿 선택'**
  String get templateSelection;

  /// No description provided for @templateSelectionDesc.
  ///
  /// In ko, this message translates to:
  /// **'어떤 종류의 고민인지 선택해주세요.'**
  String get templateSelectionDesc;

  /// No description provided for @createConcern.
  ///
  /// In ko, this message translates to:
  /// **'고민 만들기'**
  String get createConcern;

  /// No description provided for @selectTemplate.
  ///
  /// In ko, this message translates to:
  /// **'템플릿을 선택하세요'**
  String get selectTemplate;

  /// No description provided for @proceed.
  ///
  /// In ko, this message translates to:
  /// **'진행하기'**
  String get proceed;

  /// No description provided for @templateCareerTitle.
  ///
  /// In ko, this message translates to:
  /// **'진로/커리어'**
  String get templateCareerTitle;

  /// No description provided for @templateCareerDesc.
  ///
  /// In ko, this message translates to:
  /// **'직업, 이직, 진로 선택'**
  String get templateCareerDesc;

  /// No description provided for @templateCareerExample.
  ///
  /// In ko, this message translates to:
  /// **'A회사 vs B회사, 이직 고민'**
  String get templateCareerExample;

  /// No description provided for @templateCareerExampleDesc.
  ///
  /// In ko, this message translates to:
  /// **'A회사는 연봉은 높지만 야근이 잦고, B회사는 워라밸은 보장되지만 성장이 정체될 것 같아 고민입니다. 현재 회사에 남는 선택지도 고려 중입니다.'**
  String get templateCareerExampleDesc;

  /// No description provided for @templateCareerChoice1.
  ///
  /// In ko, this message translates to:
  /// **'연봉이 높은 A사로 이직한다.'**
  String get templateCareerChoice1;

  /// No description provided for @templateCareerChoice2.
  ///
  /// In ko, this message translates to:
  /// **'워라밸이 좋은 B사로 이직한다.'**
  String get templateCareerChoice2;

  /// No description provided for @templateCareerChoice3.
  ///
  /// In ko, this message translates to:
  /// **'집 가까운 C사로 이직한다.'**
  String get templateCareerChoice3;

  /// No description provided for @templateCareerChoice4.
  ///
  /// In ko, this message translates to:
  /// **'현 직장에 남아서 새로운 기회를 모색한다.'**
  String get templateCareerChoice4;

  /// No description provided for @templateCareerPriority1.
  ///
  /// In ko, this message translates to:
  /// **'연봉'**
  String get templateCareerPriority1;

  /// No description provided for @templateCareerPriority1_2.
  ///
  /// In ko, this message translates to:
  /// **'보상'**
  String get templateCareerPriority1_2;

  /// No description provided for @templateCareerPriority2.
  ///
  /// In ko, this message translates to:
  /// **'워라밸'**
  String get templateCareerPriority2;

  /// No description provided for @templateCareerPriority3.
  ///
  /// In ko, this message translates to:
  /// **'성장 가능성'**
  String get templateCareerPriority3;

  /// No description provided for @templateCareerPriority4.
  ///
  /// In ko, this message translates to:
  /// **'흥미'**
  String get templateCareerPriority4;

  /// No description provided for @templateCareerPriority4_2.
  ///
  /// In ko, this message translates to:
  /// **'성취감'**
  String get templateCareerPriority4_2;

  /// No description provided for @templateCareerPriority5.
  ///
  /// In ko, this message translates to:
  /// **'조직 문화'**
  String get templateCareerPriority5;

  /// No description provided for @templateCareerPriority6.
  ///
  /// In ko, this message translates to:
  /// **'동료'**
  String get templateCareerPriority6;

  /// No description provided for @templateFinanceTitle.
  ///
  /// In ko, this message translates to:
  /// **'소비/재테크'**
  String get templateFinanceTitle;

  /// No description provided for @templateFinanceDesc.
  ///
  /// In ko, this message translates to:
  /// **'구매, 투자, 소비 결정'**
  String get templateFinanceDesc;

  /// No description provided for @templateFinanceExample.
  ///
  /// In ko, this message translates to:
  /// **'신형 노트북, 지금 사는 게 맞을까?'**
  String get templateFinanceExample;

  /// No description provided for @templateFinanceExampleDesc.
  ///
  /// In ko, this message translates to:
  /// **'지금 쓰는 노트북도 아직 쓸만하지만, 새로 나온 모델의 성능과 디자인이 마음에 들어서 바꾸고 싶어요. 하지만 꽤 큰 지출이라 망설여집니다.'**
  String get templateFinanceExampleDesc;

  /// No description provided for @templateFinanceChoice1.
  ///
  /// In ko, this message translates to:
  /// **'할부로 신형 노트북을 구매한다.'**
  String get templateFinanceChoice1;

  /// No description provided for @templateFinanceChoice2.
  ///
  /// In ko, this message translates to:
  /// **'1년 더 참고 기존 노트북을 사용한다.'**
  String get templateFinanceChoice2;

  /// No description provided for @templateFinanceChoice3.
  ///
  /// In ko, this message translates to:
  /// **'대안으로 중고 모델을 알아본다.'**
  String get templateFinanceChoice3;

  /// No description provided for @templateFinanceChoice4.
  ///
  /// In ko, this message translates to:
  /// **'사지 않는다.'**
  String get templateFinanceChoice4;

  /// No description provided for @templateFinancePriority1.
  ///
  /// In ko, this message translates to:
  /// **'가성비'**
  String get templateFinancePriority1;

  /// No description provided for @templateFinancePriority2.
  ///
  /// In ko, this message translates to:
  /// **'만족감'**
  String get templateFinancePriority2;

  /// No description provided for @templateFinancePriority2_2.
  ///
  /// In ko, this message translates to:
  /// **'욕구 충족'**
  String get templateFinancePriority2_2;

  /// No description provided for @templateFinancePriority3.
  ///
  /// In ko, this message translates to:
  /// **'미래 가치'**
  String get templateFinancePriority3;

  /// No description provided for @templateFinancePriority4.
  ///
  /// In ko, this message translates to:
  /// **'실용성'**
  String get templateFinancePriority4;

  /// No description provided for @templateFinancePriority4_2.
  ///
  /// In ko, this message translates to:
  /// **'필요성'**
  String get templateFinancePriority4_2;

  /// No description provided for @templateFinancePriority5.
  ///
  /// In ko, this message translates to:
  /// **'안정성'**
  String get templateFinancePriority5;

  /// No description provided for @templateFinancePriority6.
  ///
  /// In ko, this message translates to:
  /// **'리스크'**
  String get templateFinancePriority6;

  /// No description provided for @templateRelationshipTitle.
  ///
  /// In ko, this message translates to:
  /// **'인간관계'**
  String get templateRelationshipTitle;

  /// No description provided for @templateRelationshipDesc.
  ///
  /// In ko, this message translates to:
  /// **'친구, 가족, 연인 관계'**
  String get templateRelationshipDesc;

  /// No description provided for @templateRelationshipExample.
  ///
  /// In ko, this message translates to:
  /// **'친구의 부탁, 어떻게 거절해야 할까?'**
  String get templateRelationshipExample;

  /// No description provided for @templateRelationshipExampleDesc.
  ///
  /// In ko, this message translates to:
  /// **'친한 친구가 무리한 부탁을 했는데, 들어주기엔 제가 너무 힘들 것 같아요. 거절하면 친구와의 사이가 멀어질까 봐 걱정됩니다.'**
  String get templateRelationshipExampleDesc;

  /// No description provided for @templateRelationshipChoice1.
  ///
  /// In ko, this message translates to:
  /// **'솔직하게 내 상황을 이야기하고 거절한다.'**
  String get templateRelationshipChoice1;

  /// No description provided for @templateRelationshipChoice2.
  ///
  /// In ko, this message translates to:
  /// **'힘들지만 이번 한 번만 친구의 부탁을 들어준다.'**
  String get templateRelationshipChoice2;

  /// No description provided for @templateRelationshipChoice3.
  ///
  /// In ko, this message translates to:
  /// **'대안을 제시하며 부탁의 일부만 들어준다.'**
  String get templateRelationshipChoice3;

  /// No description provided for @templateRelationshipChoice4.
  ///
  /// In ko, this message translates to:
  /// **'나도 다른 제안을 한다.'**
  String get templateRelationshipChoice4;

  /// No description provided for @templateRelationshipPriority1.
  ///
  /// In ko, this message translates to:
  /// **'나의 감정'**
  String get templateRelationshipPriority1;

  /// No description provided for @templateRelationshipPriority2.
  ///
  /// In ko, this message translates to:
  /// **'상대방의 감정'**
  String get templateRelationshipPriority2;

  /// No description provided for @templateRelationshipPriority3.
  ///
  /// In ko, this message translates to:
  /// **'관계의 지속성'**
  String get templateRelationshipPriority3;

  /// No description provided for @templateRelationshipPriority4.
  ///
  /// In ko, this message translates to:
  /// **'솔직함 및 명확성'**
  String get templateRelationshipPriority4;

  /// No description provided for @templateRelationshipPriority5.
  ///
  /// In ko, this message translates to:
  /// **'갈등 회피'**
  String get templateRelationshipPriority5;

  /// No description provided for @templateRelationshipPriority6.
  ///
  /// In ko, this message translates to:
  /// **'솔직함'**
  String get templateRelationshipPriority6;

  /// No description provided for @templateRelationshipPriority7.
  ///
  /// In ko, this message translates to:
  /// **'명확성'**
  String get templateRelationshipPriority7;

  /// No description provided for @templateLifestyleTitle.
  ///
  /// In ko, this message translates to:
  /// **'일상/습관'**
  String get templateLifestyleTitle;

  /// No description provided for @templateLifestyleDesc.
  ///
  /// In ko, this message translates to:
  /// **'운동, 학습, 생활 패턴'**
  String get templateLifestyleDesc;

  /// No description provided for @templateLifestyleExample.
  ///
  /// In ko, this message translates to:
  /// **'아침 운동 vs 저녁 운동'**
  String get templateLifestyleExample;

  /// No description provided for @templateLifestyleExampleDesc.
  ///
  /// In ko, this message translates to:
  /// **'건강을 위해 운동을 시작하려고 합니다. 아침에 하면 하루가 개운할 것 같지만, 저녁 약속이 자유로운 저녁 운동도 포기하기 어렵습니다.'**
  String get templateLifestyleExampleDesc;

  /// No description provided for @templateLifestyleChoice1.
  ///
  /// In ko, this message translates to:
  /// **'30분 일찍 일어나 아침 운동을 한다.'**
  String get templateLifestyleChoice1;

  /// No description provided for @templateLifestyleChoice2.
  ///
  /// In ko, this message translates to:
  /// **'퇴근 후 저녁 시간을 활용해 운동한다.'**
  String get templateLifestyleChoice2;

  /// No description provided for @templateLifestyleChoice3.
  ///
  /// In ko, this message translates to:
  /// **'주 2회는 아침, 주 2회는 저녁에 운동한다.'**
  String get templateLifestyleChoice3;

  /// No description provided for @templateLifestyleChoice4.
  ///
  /// In ko, this message translates to:
  /// **'운동을 하지 않는다.'**
  String get templateLifestyleChoice4;

  /// No description provided for @templateLifestylePriority1.
  ///
  /// In ko, this message translates to:
  /// **'건강'**
  String get templateLifestylePriority1;

  /// No description provided for @templateLifestylePriority2.
  ///
  /// In ko, this message translates to:
  /// **'시간 효율'**
  String get templateLifestylePriority2;

  /// No description provided for @templateLifestylePriority3.
  ///
  /// In ko, this message translates to:
  /// **'의지력'**
  String get templateLifestylePriority3;

  /// No description provided for @templateLifestylePriority3_2.
  ///
  /// In ko, this message translates to:
  /// **'실천 가능성'**
  String get templateLifestylePriority3_2;

  /// No description provided for @templateLifestylePriority4.
  ///
  /// In ko, this message translates to:
  /// **'즐거움'**
  String get templateLifestylePriority4;

  /// No description provided for @templateLifestylePriority5.
  ///
  /// In ko, this message translates to:
  /// **'장기적 이득'**
  String get templateLifestylePriority5;

  /// No description provided for @templateFreeTitle.
  ///
  /// In ko, this message translates to:
  /// **'자유 형식'**
  String get templateFreeTitle;

  /// No description provided for @templateFreeDesc.
  ///
  /// In ko, this message translates to:
  /// **'자유롭게 고민 작성'**
  String get templateFreeDesc;

  /// No description provided for @templateFreeExample.
  ///
  /// In ko, this message translates to:
  /// **'주말에 뭐 할까?'**
  String get templateFreeExample;

  /// No description provided for @templateFreeExampleDesc.
  ///
  /// In ko, this message translates to:
  /// **'쉬고 싶기도 하고, 친구들을 만나서 놀고 싶기도 해요.'**
  String get templateFreeExampleDesc;

  /// No description provided for @templateFreeChoice1.
  ///
  /// In ko, this message translates to:
  /// **'집에서 영화 보며 휴식하기'**
  String get templateFreeChoice1;

  /// No description provided for @templateFreeChoice2.
  ///
  /// In ko, this message translates to:
  /// **'친구들과 만나서 저녁 먹기'**
  String get templateFreeChoice2;

  /// No description provided for @templateFreeChoice3.
  ///
  /// In ko, this message translates to:
  /// **'서점에 가기'**
  String get templateFreeChoice3;

  /// No description provided for @templateFreeChoice4.
  ///
  /// In ko, this message translates to:
  /// **'운동 가기'**
  String get templateFreeChoice4;

  /// No description provided for @templateFreePriority1.
  ///
  /// In ko, this message translates to:
  /// **'만족도'**
  String get templateFreePriority1;

  /// No description provided for @templateFreePriority2.
  ///
  /// In ko, this message translates to:
  /// **'비용'**
  String get templateFreePriority2;

  /// No description provided for @templateFreePriority3.
  ///
  /// In ko, this message translates to:
  /// **'시간'**
  String get templateFreePriority3;

  /// No description provided for @templateFreePriority4.
  ///
  /// In ko, this message translates to:
  /// **'스트레스'**
  String get templateFreePriority4;

  /// No description provided for @templateFreePriority5.
  ///
  /// In ko, this message translates to:
  /// **'장기적 이득'**
  String get templateFreePriority5;

  /// No description provided for @templateFreePriority6.
  ///
  /// In ko, this message translates to:
  /// **'노력'**
  String get templateFreePriority6;

  /// No description provided for @statusInProgress.
  ///
  /// In ko, this message translates to:
  /// **'진행중'**
  String get statusInProgress;

  /// No description provided for @statusResolved.
  ///
  /// In ko, this message translates to:
  /// **'해결'**
  String get statusResolved;

  /// No description provided for @statusArchived.
  ///
  /// In ko, this message translates to:
  /// **'보관'**
  String get statusArchived;

  /// No description provided for @selectedChoice.
  ///
  /// In ko, this message translates to:
  /// **'선택'**
  String get selectedChoice;

  /// No description provided for @analysisMethodSelection.
  ///
  /// In ko, this message translates to:
  /// **'분석 방법 선택'**
  String get analysisMethodSelection;

  /// No description provided for @logicalAnalysisTitle.
  ///
  /// In ko, this message translates to:
  /// **'논리 분석'**
  String get logicalAnalysisTitle;

  /// No description provided for @logicalAnalysisSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'가치관을 설정하고 점수를 매겨 객관적으로 비교해보세요'**
  String get logicalAnalysisSubtitle;

  /// No description provided for @intuitiveAnalysisTitle.
  ///
  /// In ko, this message translates to:
  /// **'직관 분석'**
  String get intuitiveAnalysisTitle;

  /// No description provided for @intuitiveAnalysisSubtitle.
  ///
  /// In ko, this message translates to:
  /// **'타로카드를 통해 내면의 소리를 들어보세요'**
  String get intuitiveAnalysisSubtitle;

  /// No description provided for @finalChoiceSelection.
  ///
  /// In ko, this message translates to:
  /// **'선택지 최종 선택'**
  String get finalChoiceSelection;

  /// No description provided for @finalDecisionConfirmation.
  ///
  /// In ko, this message translates to:
  /// **'최종 결정 확인'**
  String get finalDecisionConfirmation;

  /// No description provided for @finalDecisionMessage.
  ///
  /// In ko, this message translates to:
  /// **'\'{choice}: {description}\'(으)로 결정을 완료하시겠어요?'**
  String finalDecisionMessage(Object choice, Object description);

  /// No description provided for @comparisonItemSetup.
  ///
  /// In ko, this message translates to:
  /// **'비교 항목 설정'**
  String get comparisonItemSetup;

  /// No description provided for @addComparisonItem.
  ///
  /// In ko, this message translates to:
  /// **'비교 항목 추가'**
  String get addComparisonItem;

  /// No description provided for @comparisonItemNameHint.
  ///
  /// In ko, this message translates to:
  /// **'비교 항목 이름을 입력하세요'**
  String get comparisonItemNameHint;

  /// No description provided for @add.
  ///
  /// In ko, this message translates to:
  /// **'추가'**
  String get add;

  /// No description provided for @selectedItems.
  ///
  /// In ko, this message translates to:
  /// **'선택된 항목'**
  String get selectedItems;

  /// No description provided for @next.
  ///
  /// In ko, this message translates to:
  /// **'다음'**
  String get next;

  /// No description provided for @scoring.
  ///
  /// In ko, this message translates to:
  /// **'점수 매기기'**
  String get scoring;

  /// No description provided for @frameworkNotFound.
  ///
  /// In ko, this message translates to:
  /// **'프레임워크를 찾을 수 없습니다'**
  String get frameworkNotFound;

  /// No description provided for @noChoices.
  ///
  /// In ko, this message translates to:
  /// **'선택지가 없습니다'**
  String get noChoices;

  /// No description provided for @weightSettings.
  ///
  /// In ko, this message translates to:
  /// **'가중치 설정'**
  String get weightSettings;

  /// No description provided for @weightSettingsDesc.
  ///
  /// In ko, this message translates to:
  /// **'각 항목의 중요도를 1-10 사이로 설정해주세요'**
  String get weightSettingsDesc;

  /// No description provided for @low.
  ///
  /// In ko, this message translates to:
  /// **'낮음'**
  String get low;

  /// No description provided for @high.
  ///
  /// In ko, this message translates to:
  /// **'높음'**
  String get high;

  /// No description provided for @scoringDesc.
  ///
  /// In ko, this message translates to:
  /// **'각 항목별로 선택지의 점수를 매겨주세요 (1-10)'**
  String get scoringDesc;

  /// No description provided for @weight.
  ///
  /// In ko, this message translates to:
  /// **'가중치'**
  String get weight;

  /// No description provided for @viewResults.
  ///
  /// In ko, this message translates to:
  /// **'결과 보기'**
  String get viewResults;

  /// No description provided for @analysisResult.
  ///
  /// In ko, this message translates to:
  /// **'분석 결과'**
  String get analysisResult;

  /// No description provided for @tie.
  ///
  /// In ko, this message translates to:
  /// **'동점입니다!'**
  String get tie;

  /// No description provided for @tieDescription.
  ///
  /// In ko, this message translates to:
  /// **'여러 선택지가 비슷한 점수를 받았습니다'**
  String get tieDescription;

  /// No description provided for @totalScoreComparison.
  ///
  /// In ko, this message translates to:
  /// **'총점 비교'**
  String get totalScoreComparison;

  /// No description provided for @points.
  ///
  /// In ko, this message translates to:
  /// **'점'**
  String get points;

  /// No description provided for @detailedAnalysis.
  ///
  /// In ko, this message translates to:
  /// **'상세 분석'**
  String get detailedAnalysis;

  /// No description provided for @language.
  ///
  /// In ko, this message translates to:
  /// **'언어'**
  String get language;

  /// No description provided for @korean.
  ///
  /// In ko, this message translates to:
  /// **'한국어'**
  String get korean;

  /// No description provided for @english.
  ///
  /// In ko, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @oracleCard1Name.
  ///
  /// In ko, this message translates to:
  /// **'탄생'**
  String get oracleCard1Name;

  /// No description provided for @oracleCard1Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard1Text;

  /// No description provided for @oracleCard1Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard1Percentage;

  /// No description provided for @oracleCard1Description.
  ///
  /// In ko, this message translates to:
  /// **'태양의 가호를 받은 태양 카드는 모든 일의 출발과 시작입니다. 될 일은 결코 이루어집니다.'**
  String get oracleCard1Description;

  /// No description provided for @oracleCard2Name.
  ///
  /// In ko, this message translates to:
  /// **'상승'**
  String get oracleCard2Name;

  /// No description provided for @oracleCard2Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard2Text;

  /// No description provided for @oracleCard2Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard2Percentage;

  /// No description provided for @oracleCard2Description.
  ///
  /// In ko, this message translates to:
  /// **'위로 올라가는 상승 카드는 하는 일에 승리가 따를 것을 보여줍니다.'**
  String get oracleCard2Description;

  /// No description provided for @oracleCard3Name.
  ///
  /// In ko, this message translates to:
  /// **'명예'**
  String get oracleCard3Name;

  /// No description provided for @oracleCard3Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard3Text;

  /// No description provided for @oracleCard3Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard3Percentage;

  /// No description provided for @oracleCard3Description.
  ///
  /// In ko, this message translates to:
  /// **'명예 카드는 질문이 곧 나의 명예를 상승시켜 줄 수 있음을 보여줍니다.'**
  String get oracleCard3Description;

  /// No description provided for @oracleCard4Name.
  ///
  /// In ko, this message translates to:
  /// **'리더쉽'**
  String get oracleCard4Name;

  /// No description provided for @oracleCard4Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard4Text;

  /// No description provided for @oracleCard4Percentage.
  ///
  /// In ko, this message translates to:
  /// **'84%'**
  String get oracleCard4Percentage;

  /// No description provided for @oracleCard4Description.
  ///
  /// In ko, this message translates to:
  /// **'리더쉽 카드는 나의 자리가 견고함을 보여줍니다. 질문이 긍정적인 방향으로 갈 것을 알려줍니다.'**
  String get oracleCard4Description;

  /// No description provided for @oracleCard5Name.
  ///
  /// In ko, this message translates to:
  /// **'우울'**
  String get oracleCard5Name;

  /// No description provided for @oracleCard5Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard5Text;

  /// No description provided for @oracleCard5Percentage.
  ///
  /// In ko, this message translates to:
  /// **'73%'**
  String get oracleCard5Percentage;

  /// No description provided for @oracleCard5Description.
  ///
  /// In ko, this message translates to:
  /// **'우울 카드는 고민이 많아지는 것을 보여줍니다. 질문의 방향이 좋지 않은 쪽으로 흘러갈 가능성이 있습니다.'**
  String get oracleCard5Description;

  /// No description provided for @oracleCard6Name.
  ///
  /// In ko, this message translates to:
  /// **'변덕/불안정'**
  String get oracleCard6Name;

  /// No description provided for @oracleCard6Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard6Text;

  /// No description provided for @oracleCard6Percentage.
  ///
  /// In ko, this message translates to:
  /// **'86%'**
  String get oracleCard6Percentage;

  /// No description provided for @oracleCard6Description.
  ///
  /// In ko, this message translates to:
  /// **'변덕 카드는 불안정한 상태를 보여줍니다. 질문의 미래가 불투명해질 수 있습니다.'**
  String get oracleCard6Description;

  /// No description provided for @oracleCard7Name.
  ///
  /// In ko, this message translates to:
  /// **'가족'**
  String get oracleCard7Name;

  /// No description provided for @oracleCard7Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard7Text;

  /// No description provided for @oracleCard7Percentage.
  ///
  /// In ko, this message translates to:
  /// **'80%'**
  String get oracleCard7Percentage;

  /// No description provided for @oracleCard7Description.
  ///
  /// In ko, this message translates to:
  /// **'가족 카드는 든든한 울타리 안에 있음을 보여줍니다. 질문의 미래가 안정적이라고 볼 수 있습니다.'**
  String get oracleCard7Description;

  /// No description provided for @oracleCard8Name.
  ///
  /// In ko, this message translates to:
  /// **'엄마'**
  String get oracleCard8Name;

  /// No description provided for @oracleCard8Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard8Text;

  /// No description provided for @oracleCard8Percentage.
  ///
  /// In ko, this message translates to:
  /// **'90%'**
  String get oracleCard8Percentage;

  /// No description provided for @oracleCard8Description.
  ///
  /// In ko, this message translates to:
  /// **'엄마 카드는 언제나 따뜻하게 품어주는 엄마와 같습니다. 질문이 긍정적인 방향으로 흘러갈 수 있습니다.'**
  String get oracleCard8Description;

  /// No description provided for @oracleCard9Name.
  ///
  /// In ko, this message translates to:
  /// **'질병'**
  String get oracleCard9Name;

  /// No description provided for @oracleCard9Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard9Text;

  /// No description provided for @oracleCard9Percentage.
  ///
  /// In ko, this message translates to:
  /// **'94%'**
  String get oracleCard9Percentage;

  /// No description provided for @oracleCard9Description.
  ///
  /// In ko, this message translates to:
  /// **'질병 카드는 뜻과 같이 일이 진행되지 않음을 보여줍니다. 결과가 좋지 않을 수 있습니다.'**
  String get oracleCard9Description;

  /// No description provided for @oracleCard10Name.
  ///
  /// In ko, this message translates to:
  /// **'변화'**
  String get oracleCard10Name;

  /// No description provided for @oracleCard10Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard10Text;

  /// No description provided for @oracleCard10Percentage.
  ///
  /// In ko, this message translates to:
  /// **'56%'**
  String get oracleCard10Percentage;

  /// No description provided for @oracleCard10Description.
  ///
  /// In ko, this message translates to:
  /// **'변화 카드는 변화를 암시합니다. 변화는 잘 대응하면 긍정적이지만 대체로 부정적입니다.'**
  String get oracleCard10Description;

  /// No description provided for @oracleCard11Name.
  ///
  /// In ko, this message translates to:
  /// **'지성'**
  String get oracleCard11Name;

  /// No description provided for @oracleCard11Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard11Text;

  /// No description provided for @oracleCard11Percentage.
  ///
  /// In ko, this message translates to:
  /// **'73%'**
  String get oracleCard11Percentage;

  /// No description provided for @oracleCard11Description.
  ///
  /// In ko, this message translates to:
  /// **'지성 카드는 꽤 긍정적입니다. 지성을 발휘하여 문제를 해결해 나갈 수 있습니다.'**
  String get oracleCard11Description;

  /// No description provided for @oracleCard12Name.
  ///
  /// In ko, this message translates to:
  /// **'도둑질'**
  String get oracleCard12Name;

  /// No description provided for @oracleCard12Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard12Text;

  /// No description provided for @oracleCard12Percentage.
  ///
  /// In ko, this message translates to:
  /// **'95%'**
  String get oracleCard12Percentage;

  /// No description provided for @oracleCard12Description.
  ///
  /// In ko, this message translates to:
  /// **'도둑질 카드는 부정적인 카드입니다. 내 생각과 다르게 타인의 부정 행위에 의해 좌절될 수 있습니다.'**
  String get oracleCard12Description;

  /// No description provided for @oracleCard13Name.
  ///
  /// In ko, this message translates to:
  /// **'거래'**
  String get oracleCard13Name;

  /// No description provided for @oracleCard13Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard13Text;

  /// No description provided for @oracleCard13Percentage.
  ///
  /// In ko, this message translates to:
  /// **'64%'**
  String get oracleCard13Percentage;

  /// No description provided for @oracleCard13Description.
  ///
  /// In ko, this message translates to:
  /// **'트레이드 카드는 꽤 긍정적입니다. 협상이 발생할 수 있지만 긍정적인 쪽으로 타협할 수 있습니다.'**
  String get oracleCard13Description;

  /// No description provided for @oracleCard14Name.
  ///
  /// In ko, this message translates to:
  /// **'즐거움'**
  String get oracleCard14Name;

  /// No description provided for @oracleCard14Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard14Text;

  /// No description provided for @oracleCard14Percentage.
  ///
  /// In ko, this message translates to:
  /// **'82%'**
  String get oracleCard14Percentage;

  /// No description provided for @oracleCard14Description.
  ///
  /// In ko, this message translates to:
  /// **'즐거움 카드는 상당히 긍정적입니다. 결과가 어찌되든 자신이 느끼는 행복과 즐거움이 따릅니다.'**
  String get oracleCard14Description;

  /// No description provided for @oracleCard15Name.
  ///
  /// In ko, this message translates to:
  /// **'평화'**
  String get oracleCard15Name;

  /// No description provided for @oracleCard15Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard15Text;

  /// No description provided for @oracleCard15Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard15Percentage;

  /// No description provided for @oracleCard15Description.
  ///
  /// In ko, this message translates to:
  /// **'평화 카드는 무척 긍정적입니다. 결과는 결국 긍정적인 방향으로 종결되고 평화가 찾아올 것입니다.'**
  String get oracleCard15Description;

  /// No description provided for @oracleCard16Name.
  ///
  /// In ko, this message translates to:
  /// **'돈'**
  String get oracleCard16Name;

  /// No description provided for @oracleCard16Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard16Text;

  /// No description provided for @oracleCard16Percentage.
  ///
  /// In ko, this message translates to:
  /// **'88%'**
  String get oracleCard16Percentage;

  /// No description provided for @oracleCard16Description.
  ///
  /// In ko, this message translates to:
  /// **'돈 카드는 긍정에 가깝습니다. 금전적으로 해결되는 일, 혹은 금전이 되어 돌아오는 일 생길 수 있습니다.'**
  String get oracleCard16Description;

  /// No description provided for @oracleCard17Name.
  ///
  /// In ko, this message translates to:
  /// **'사랑'**
  String get oracleCard17Name;

  /// No description provided for @oracleCard17Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard17Text;

  /// No description provided for @oracleCard17Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard17Percentage;

  /// No description provided for @oracleCard17Description.
  ///
  /// In ko, this message translates to:
  /// **'사랑 카드는 긍정입니다. 연애와 관련한 질문이었다면 결국 사랑의 화합으로 이어질 것입니다.'**
  String get oracleCard17Description;

  /// No description provided for @oracleCard18Name.
  ///
  /// In ko, this message translates to:
  /// **'음식과 음료'**
  String get oracleCard18Name;

  /// No description provided for @oracleCard18Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard18Text;

  /// No description provided for @oracleCard18Percentage.
  ///
  /// In ko, this message translates to:
  /// **'88%'**
  String get oracleCard18Percentage;

  /// No description provided for @oracleCard18Description.
  ///
  /// In ko, this message translates to:
  /// **'음식과 음료 카드는 긍정입니다. 맛있는걸 먹고 마시며 즐거운 시간으로 이어질 것입니다.'**
  String get oracleCard18Description;

  /// No description provided for @oracleCard19Name.
  ///
  /// In ko, this message translates to:
  /// **'악의'**
  String get oracleCard19Name;

  /// No description provided for @oracleCard19Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard19Text;

  /// No description provided for @oracleCard19Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard19Percentage;

  /// No description provided for @oracleCard19Description.
  ///
  /// In ko, this message translates to:
  /// **'악의 카드는 부정적입니다. 내 뜻과 달리 타인의 개입이나 악의로 인해 좌절될 수 있습니다.'**
  String get oracleCard19Description;

  /// No description provided for @oracleCard20Name.
  ///
  /// In ko, this message translates to:
  /// **'전쟁'**
  String get oracleCard20Name;

  /// No description provided for @oracleCard20Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard20Text;

  /// No description provided for @oracleCard20Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard20Percentage;

  /// No description provided for @oracleCard20Description.
  ///
  /// In ko, this message translates to:
  /// **'전쟁 카드는 부정적입니다. 서로 충돌하고 싸우고 오해하는 일이 생길 수 있습니다.'**
  String get oracleCard20Description;

  /// No description provided for @oracleCard21Name.
  ///
  /// In ko, this message translates to:
  /// **'적'**
  String get oracleCard21Name;

  /// No description provided for @oracleCard21Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard21Text;

  /// No description provided for @oracleCard21Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard21Percentage;

  /// No description provided for @oracleCard21Description.
  ///
  /// In ko, this message translates to:
  /// **'적 카드는 부정적입니다. 나를 해치고 음해하는 적이 가까운 곳에 있을 수 있습니다.'**
  String get oracleCard21Description;

  /// No description provided for @oracleCard22Name.
  ///
  /// In ko, this message translates to:
  /// **'불/재난'**
  String get oracleCard22Name;

  /// No description provided for @oracleCard22Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard22Text;

  /// No description provided for @oracleCard22Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard22Percentage;

  /// No description provided for @oracleCard22Description.
  ///
  /// In ko, this message translates to:
  /// **'재난 카드는 부정적입니다. 내 뜻과 다른 재해와 가까운 외부 변수로 인해 좌절될 수 있습니다.'**
  String get oracleCard22Description;

  /// No description provided for @oracleCard23Name.
  ///
  /// In ko, this message translates to:
  /// **'사고'**
  String get oracleCard23Name;

  /// No description provided for @oracleCard23Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard23Text;

  /// No description provided for @oracleCard23Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard23Percentage;

  /// No description provided for @oracleCard23Description.
  ///
  /// In ko, this message translates to:
  /// **'사고 카드는 부정적입니다. 갑작스러운 이슈가 생길 수 있습니다.'**
  String get oracleCard23Description;

  /// No description provided for @oracleCard24Name.
  ///
  /// In ko, this message translates to:
  /// **'지원/후원'**
  String get oracleCard24Name;

  /// No description provided for @oracleCard24Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard24Text;

  /// No description provided for @oracleCard24Percentage.
  ///
  /// In ko, this message translates to:
  /// **'70%'**
  String get oracleCard24Percentage;

  /// No description provided for @oracleCard24Description.
  ///
  /// In ko, this message translates to:
  /// **'성찰 카드는 긍정적입니다. 자아 성찰을 통해 더 나은 미래로 나아갈 수 있습니다.'**
  String get oracleCard24Description;

  /// No description provided for @oracleCard25Name.
  ///
  /// In ko, this message translates to:
  /// **'좋은 기회'**
  String get oracleCard25Name;

  /// No description provided for @oracleCard25Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard25Text;

  /// No description provided for @oracleCard25Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard25Percentage;

  /// No description provided for @oracleCard25Description.
  ///
  /// In ko, this message translates to:
  /// **'좋은 기회 카드는 무척 긍정적입니다. 생각하지 못한 좋은 기회가 가까운 곳에서 기다리고 있을 수 있습니다.'**
  String get oracleCard25Description;

  /// No description provided for @oracleCard26Name.
  ///
  /// In ko, this message translates to:
  /// **'명성'**
  String get oracleCard26Name;

  /// No description provided for @oracleCard26Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard26Text;

  /// No description provided for @oracleCard26Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard26Percentage;

  /// No description provided for @oracleCard26Description.
  ///
  /// In ko, this message translates to:
  /// **'명성 카드는 무척 긍정적입니다. 주변에 나의 좋은 소식, 명성이 올라가는 긍정적인 이벤트가 있을 수 있습니다.'**
  String get oracleCard26Description;

  /// No description provided for @oracleCard27Name.
  ///
  /// In ko, this message translates to:
  /// **'불운'**
  String get oracleCard27Name;

  /// No description provided for @oracleCard27Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard27Text;

  /// No description provided for @oracleCard27Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard27Percentage;

  /// No description provided for @oracleCard27Description.
  ///
  /// In ko, this message translates to:
  /// **'불운 카드는 부정적입니다. 내 실수나 잘못을 떠나서 찾아오는 불운이 생길 수 있습니다.'**
  String get oracleCard27Description;

  /// No description provided for @oracleCard28Name.
  ///
  /// In ko, this message translates to:
  /// **'비극'**
  String get oracleCard28Name;

  /// No description provided for @oracleCard28Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard28Text;

  /// No description provided for @oracleCard28Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard28Percentage;

  /// No description provided for @oracleCard28Description.
  ///
  /// In ko, this message translates to:
  /// **'비극 카드는 부정적입니다. 이름에서 느껴지듯 비극적인 결론으로 이어질 수 있으니 주의가 필요합니다.'**
  String get oracleCard28Description;

  /// No description provided for @oracleCard29Name.
  ///
  /// In ko, this message translates to:
  /// **'파멸'**
  String get oracleCard29Name;

  /// No description provided for @oracleCard29Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard29Text;

  /// No description provided for @oracleCard29Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard29Percentage;

  /// No description provided for @oracleCard29Description.
  ///
  /// In ko, this message translates to:
  /// **'파멸 카드는 부정적입니다. 이름에서 느껴지듯 파멸로 향하며 끝날 수 있습니다.'**
  String get oracleCard29Description;

  /// No description provided for @oracleCard30Name.
  ///
  /// In ko, this message translates to:
  /// **'지연/고통'**
  String get oracleCard30Name;

  /// No description provided for @oracleCard30Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard30Text;

  /// No description provided for @oracleCard30Percentage.
  ///
  /// In ko, this message translates to:
  /// **'60%'**
  String get oracleCard30Percentage;

  /// No description provided for @oracleCard30Description.
  ///
  /// In ko, this message translates to:
  /// **'지연 카드는 꽤 부정적입니다. 일의 지연과 막힘이 있을 수 있습니다.'**
  String get oracleCard30Description;

  /// No description provided for @oracleCard31Name.
  ///
  /// In ko, this message translates to:
  /// **'고립'**
  String get oracleCard31Name;

  /// No description provided for @oracleCard31Text.
  ///
  /// In ko, this message translates to:
  /// **'NO'**
  String get oracleCard31Text;

  /// No description provided for @oracleCard31Percentage.
  ///
  /// In ko, this message translates to:
  /// **'70%'**
  String get oracleCard31Percentage;

  /// No description provided for @oracleCard31Description.
  ///
  /// In ko, this message translates to:
  /// **'고립 카드는 꽤 부정적입니다. 혼자 고립되어 외롭고 고독한 시간을 보낼 수 있습니다.'**
  String get oracleCard31Description;

  /// No description provided for @oracleCard32Name.
  ///
  /// In ko, this message translates to:
  /// **'대화/유머'**
  String get oracleCard32Name;

  /// No description provided for @oracleCard32Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard32Text;

  /// No description provided for @oracleCard32Percentage.
  ///
  /// In ko, this message translates to:
  /// **'80%'**
  String get oracleCard32Percentage;

  /// No description provided for @oracleCard32Description.
  ///
  /// In ko, this message translates to:
  /// **'유머 카드는 꽤 긍정적입니다. 누군가와 즐겁게 대화하고 웃을 수 있는 시간이 있을 수 있습니다.'**
  String get oracleCard32Description;

  /// No description provided for @oracleCard33Name.
  ///
  /// In ko, this message translates to:
  /// **'지혜'**
  String get oracleCard33Name;

  /// No description provided for @oracleCard33Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard33Text;

  /// No description provided for @oracleCard33Percentage.
  ///
  /// In ko, this message translates to:
  /// **'89%'**
  String get oracleCard33Percentage;

  /// No description provided for @oracleCard33Description.
  ///
  /// In ko, this message translates to:
  /// **'지혜 카드는 지혜로 어려움이나 난관을 헤쳐나갈 수 있음을 보여줍니다. 긍정적입니다.'**
  String get oracleCard33Description;

  /// No description provided for @oracleCard34Name.
  ///
  /// In ko, this message translates to:
  /// **'행복'**
  String get oracleCard34Name;

  /// No description provided for @oracleCard34Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard34Text;

  /// No description provided for @oracleCard34Percentage.
  ///
  /// In ko, this message translates to:
  /// **'100%'**
  String get oracleCard34Percentage;

  /// No description provided for @oracleCard34Description.
  ///
  /// In ko, this message translates to:
  /// **'행복 카드는 곧 행복의 감정이 찾아올 것을 보여줍니다. 행복은 멀리 있지 않습니다.'**
  String get oracleCard34Description;

  /// No description provided for @oracleCard35Name.
  ///
  /// In ko, this message translates to:
  /// **'건강한 가치관'**
  String get oracleCard35Name;

  /// No description provided for @oracleCard35Text.
  ///
  /// In ko, this message translates to:
  /// **'YES'**
  String get oracleCard35Text;

  /// No description provided for @oracleCard35Percentage.
  ///
  /// In ko, this message translates to:
  /// **'84%'**
  String get oracleCard35Percentage;

  /// No description provided for @oracleCard35Description.
  ///
  /// In ko, this message translates to:
  /// **'마음 깊이 자리 잡은 건강한 가치관으로 어려움을 이겨내고 극복할 수 있음을 보여줍니다. 무척 긍정적입니다.'**
  String get oracleCard35Description;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
