// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Choicely';

  @override
  String get appTitle => 'Intuitive and Logical Analysis for Decision Making';

  @override
  String get concernList => 'Concern List';

  @override
  String get concernDetail => 'Concern Detail';

  @override
  String get addConcern => 'New Concern';

  @override
  String get deleteConcern => 'Delete Concern';

  @override
  String get deleteConcernMessage =>
      'Are you sure you want to delete this concern?\nDeleted concerns cannot be recovered.';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get confirm => 'Confirm';

  @override
  String get noConcerns => 'No concerns yet';

  @override
  String get addNewConcern => 'Add a new concern';

  @override
  String get addConcernButton => 'Add Concern';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get whatIsYourConcern => 'What is your concern?';

  @override
  String get solveConcernDeeply => 'Solve your concern with deep analysis.';

  @override
  String get concernTitle => 'Concern Title';

  @override
  String get concernTitleHint =>
      'e.g., Should I choose Company A or Company B?';

  @override
  String get titleRequired => 'Please enter a title';

  @override
  String get description => 'Description';

  @override
  String get descriptionHint => 'Please describe your concern in detail';

  @override
  String get descriptionRequired => 'Please enter a description';

  @override
  String get analysisMethod => 'Choose Analysis Method';

  @override
  String get logicalAnalysis => 'Logical';

  @override
  String get logicalAnalysisDesc =>
      'Set your values and score objectively to compare options';

  @override
  String get intuitiveAnalysis => 'Intuitive Analysis';

  @override
  String get intuitiveAnalysisDesc =>
      'Listen to your inner voice through tarot cards';

  @override
  String get finalChoice => 'Final Choice Selection';

  @override
  String get makeFinalDecision => 'Make Final Decision';

  @override
  String get completed => 'Completed';

  @override
  String get recommendedChoice => 'Recommended Choice';

  @override
  String get score => 'Score';

  @override
  String get tarotCardResult => 'Tarot Card Result';

  @override
  String cardNumber(Object number) {
    return 'Card $number';
  }

  @override
  String get finalDecisionConfirm => 'Final Decision Confirmation';

  @override
  String choiceLabel(Object index) {
    return 'Choice $index';
  }

  @override
  String get analysisComplete => 'Analysis Complete';

  @override
  String get tarotCardAnalysis => 'Tarot Card Analysis';

  @override
  String get tarotCardAnalysisDesc =>
      'Receive messages of destiny for each choice.';

  @override
  String get checkDestinyForChoice => 'Check the destiny for this choice.';

  @override
  String get drawTarotCard => 'Draw Tarot Card';

  @override
  String get destinyCardSelection => 'Destiny Card Selection';

  @override
  String get selectCardYouLike => 'Please select one card you like';

  @override
  String get viewCardResult => 'View Card Result';

  @override
  String get selectChoice => 'Select Choice';

  @override
  String get inProgress => 'In Progress';

  @override
  String get scheduled => 'Scheduled';

  @override
  String get logical => 'Logical';

  @override
  String get intuitive => 'Intuitive';

  @override
  String get resolved => 'Resolved';

  @override
  String get archived => 'Archived';

  @override
  String get selectComparisonItems => 'Select items to compare';

  @override
  String get selectImportantValues =>
      'Choose the values that are important to you';

  @override
  String get addCustomItem => 'Add Custom';

  @override
  String get recommendedItems => 'Recommended Items';

  @override
  String get tarotMessage1 =>
      'New beginnings and opportunities are approaching. Take courage and take the first step.';

  @override
  String get tarotMessage2 =>
      'It\'s time to seek balance and harmony. Listen to others\' opinions as well.';

  @override
  String get tarotMessage3 =>
      'Your creativity and expression are shining. Approach in your own unique way.';

  @override
  String get tarotMessage4 =>
      'It\'s time to build stability and foundation. Steady effort will bear fruit.';

  @override
  String get tarotMessage5 =>
      'Change and challenges await. Don\'t be afraid to try new things.';

  @override
  String get tarotMessage6 =>
      'You can solve problems through harmony and balance. Find a compromise.';

  @override
  String get tarotMessage7 =>
      'Trust your inner wisdom and intuition. Don\'t rush, judge carefully.';

  @override
  String get tarotMessage8 =>
      'It\'s time for determination and action. Don\'t hesitate, take action.';

  @override
  String get tarotMessage9 =>
      'It\'s time for completion and achievement. Your efforts will be recognized.';

  @override
  String get tarotMessage10 =>
      'The beginning of a new cycle. Organize the past and move toward the future.';

  @override
  String get destinyMessage => 'Receive a message from destiny.';

  @override
  String get career => 'Career';

  @override
  String get careerDesc => 'Job, career change, career choice';

  @override
  String get careerExample => 'Company A vs Company B, job change dilemma';

  @override
  String get careerExampleDesc =>
      'Company A offers higher salary but frequent overtime, while Company B guarantees work-life balance but seems to have stagnant growth. I\'m also considering staying at my current company.';

  @override
  String get careerChoice1 => 'Switch to Company A with higher salary.';

  @override
  String get careerChoice2 =>
      'Switch to Company B with better work-life balance.';

  @override
  String get careerChoice3 => 'Switch to Company C closer to home.';

  @override
  String get careerChoice4 =>
      'Stay at current company and seek new opportunities.';

  @override
  String get careerPriority1 => 'Salary and compensation';

  @override
  String get careerPriority2 => 'Work-life balance';

  @override
  String get careerPriority3 => 'Growth potential';

  @override
  String get careerPriority4 => 'Interest and achievement';

  @override
  String get careerPriority5 => 'Company culture and colleagues';

  @override
  String get concernAdded => 'Concern has been added';

  @override
  String get optionSetting => 'Option Settings';

  @override
  String get howManyOptions => 'How many options are you considering?';

  @override
  String numberOfOptions(Object number) {
    return '$number options';
  }

  @override
  String optionLabel(Object label) {
    return 'Option $label';
  }

  @override
  String get optionHint1 => 'Enter your first option';

  @override
  String get optionHint2 => 'Enter your second option';

  @override
  String get optionHint3 => 'Enter your third option';

  @override
  String get optionHint4 => 'Enter your fourth option';

  @override
  String get templateSelection => 'Template Selection';

  @override
  String get templateSelectionDesc =>
      'Please select what type of concern this is.';

  @override
  String get createConcern => 'Create Concern';

  @override
  String get selectTemplate => 'Please select a template';

  @override
  String get proceed => 'Proceed';

  @override
  String get templateCareerTitle => 'Career';

  @override
  String get templateCareerDesc => 'Job, career change, career choice';

  @override
  String get templateCareerExample =>
      'Company A vs Company B, job change dilemma';

  @override
  String get templateCareerExampleDesc =>
      'Company A offers higher salary but frequent overtime, while Company B guarantees work-life balance but seems to have stagnant growth. I\'m also considering staying at my current company.';

  @override
  String get templateCareerChoice1 => 'Switch to Company A with higher salary.';

  @override
  String get templateCareerChoice2 =>
      'Switch to Company B with better work-life balance.';

  @override
  String get templateCareerChoice3 => 'Switch to Company C closer to home.';

  @override
  String get templateCareerChoice4 =>
      'Stay at current company and seek new opportunities.';

  @override
  String get templateCareerPriority1 => 'Salary';

  @override
  String get templateCareerPriority1_2 => 'Compensation';

  @override
  String get templateCareerPriority2 => 'Work-life balance';

  @override
  String get templateCareerPriority3 => 'Growth potential';

  @override
  String get templateCareerPriority4 => 'Interest';

  @override
  String get templateCareerPriority4_2 => 'Achievement';

  @override
  String get templateCareerPriority5 => 'Company culture';

  @override
  String get templateCareerPriority6 => 'Colleagues';

  @override
  String get templateFinanceTitle => 'Finance/Investment';

  @override
  String get templateFinanceDesc => 'Purchase, investment, spending decisions';

  @override
  String get templateFinanceExample => 'New laptop, should I buy it now?';

  @override
  String get templateFinanceExampleDesc =>
      'My current laptop is still usable, but I want to upgrade to the new model because I like its performance and design. However, it\'s a significant expense so I\'m hesitant.';

  @override
  String get templateFinanceChoice1 => 'Buy the new laptop on installment.';

  @override
  String get templateFinanceChoice2 =>
      'Wait one more year and continue using the current laptop.';

  @override
  String get templateFinanceChoice3 =>
      'Look for a used model as an alternative.';

  @override
  String get templateFinanceChoice4 => 'Don\'t buy it.';

  @override
  String get templateFinancePriority1 => 'Value for money';

  @override
  String get templateFinancePriority2 => 'Satisfaction';

  @override
  String get templateFinancePriority2_2 => 'Desire fulfillment';

  @override
  String get templateFinancePriority3 => 'Future value';

  @override
  String get templateFinancePriority4 => 'Practicality';

  @override
  String get templateFinancePriority4_2 => 'Necessity';

  @override
  String get templateFinancePriority5 => 'Stability';

  @override
  String get templateFinancePriority6 => 'Risk';

  @override
  String get templateRelationshipTitle => 'Relationships';

  @override
  String get templateRelationshipDesc =>
      'Friends, family, romantic relationships';

  @override
  String get templateRelationshipExample =>
      'Friend\'s request, how should I decline?';

  @override
  String get templateRelationshipExampleDesc =>
      'A close friend made an unreasonable request, and I think it would be too difficult for me to fulfill. I\'m worried that declining might distance our friendship.';

  @override
  String get templateRelationshipChoice1 =>
      'Honestly explain my situation and decline.';

  @override
  String get templateRelationshipChoice2 =>
      'It\'s difficult, but I\'ll help my friend this one time.';

  @override
  String get templateRelationshipChoice3 =>
      'Suggest alternatives and fulfill part of the request.';

  @override
  String get templateRelationshipChoice4 =>
      'I\'ll make a different suggestion.';

  @override
  String get templateRelationshipPriority1 => 'My feelings';

  @override
  String get templateRelationshipPriority2 => 'Other person\'s feelings';

  @override
  String get templateRelationshipPriority3 => 'Relationship continuity';

  @override
  String get templateRelationshipPriority4 => 'Honesty and clarity';

  @override
  String get templateRelationshipPriority5 => 'Conflict avoidance';

  @override
  String get templateRelationshipPriority6 => 'Honesty';

  @override
  String get templateRelationshipPriority7 => 'Clarity';

  @override
  String get templateLifestyleTitle => 'Lifestyle/Habits';

  @override
  String get templateLifestyleDesc => 'Exercise, learning, daily patterns';

  @override
  String get templateLifestyleExample => 'Morning exercise vs evening exercise';

  @override
  String get templateLifestyleExampleDesc =>
      'I want to start exercising for my health. Morning exercise seems like it would make my day refreshing, but evening exercise when I\'m free from evening commitments is also hard to give up.';

  @override
  String get templateLifestyleChoice1 =>
      'Wake up 30 minutes earlier for morning exercise.';

  @override
  String get templateLifestyleChoice2 =>
      'Use evening time after work for exercise.';

  @override
  String get templateLifestyleChoice3 =>
      'Exercise twice in the morning and twice in the evening per week.';

  @override
  String get templateLifestyleChoice4 => 'Don\'t exercise.';

  @override
  String get templateLifestylePriority1 => 'Health';

  @override
  String get templateLifestylePriority2 => 'Time efficiency';

  @override
  String get templateLifestylePriority3 => 'Willpower';

  @override
  String get templateLifestylePriority3_2 => 'Feasibility';

  @override
  String get templateLifestylePriority4 => 'Enjoyment';

  @override
  String get templateLifestylePriority5 => 'Long-term benefits';

  @override
  String get templateFreeTitle => 'Free Form';

  @override
  String get templateFreeDesc => 'Write your concern freely';

  @override
  String get templateFreeExample => 'What should I do this weekend?';

  @override
  String get templateFreeExampleDesc =>
      'I want to rest, but I also want to meet friends and have fun.';

  @override
  String get templateFreeChoice1 => 'Rest at home watching movies';

  @override
  String get templateFreeChoice2 => 'Meet friends for dinner';

  @override
  String get templateFreeChoice3 => 'Go to a bookstore';

  @override
  String get templateFreeChoice4 => 'Go exercise';

  @override
  String get templateFreePriority1 => 'Satisfaction';

  @override
  String get templateFreePriority2 => 'Cost';

  @override
  String get templateFreePriority3 => 'Time';

  @override
  String get templateFreePriority4 => 'Stress';

  @override
  String get templateFreePriority5 => 'Long-term benefits';

  @override
  String get templateFreePriority6 => 'Effort';

  @override
  String get statusInProgress => 'In Progress';

  @override
  String get statusResolved => 'Resolved';

  @override
  String get statusArchived => 'Archived';

  @override
  String get selectedChoice => 'Selected';

  @override
  String get analysisMethodSelection => 'Analysis Method Selection';

  @override
  String get logicalAnalysisTitle => 'Logical Analysis';

  @override
  String get logicalAnalysisSubtitle =>
      'Set your values and score to compare objectively';

  @override
  String get intuitiveAnalysisTitle => 'Intuitive Analysis';

  @override
  String get intuitiveAnalysisSubtitle =>
      'Listen to your inner voice through tarot cards';

  @override
  String get finalChoiceSelection => 'Final Choice Selection';

  @override
  String get finalDecisionConfirmation => 'Final Decision Confirmation';

  @override
  String finalDecisionMessage(Object choice, Object description) {
    return 'Are you sure you want to complete your decision with \'$choice: $description\'?';
  }

  @override
  String get comparisonItemSetup => 'Comparison Item Setup';

  @override
  String get addComparisonItem => 'Add Comparison Item';

  @override
  String get comparisonItemNameHint => 'Enter comparison item name';

  @override
  String get add => 'Add';

  @override
  String get selectedItems => 'Selected Items';

  @override
  String get next => 'Next';

  @override
  String get scoring => 'Scoring';

  @override
  String get frameworkNotFound => 'Framework not found';

  @override
  String get noChoices => 'No choices available';

  @override
  String get weightSettings => 'Weight Settings';

  @override
  String get weightSettingsDesc => 'Set the importance of each item from 1-10';

  @override
  String get low => 'Low';

  @override
  String get high => 'High';

  @override
  String get scoringDesc => 'Score each choice for each item (1-10)';

  @override
  String get weight => 'Weight';

  @override
  String get viewResults => 'View Results';

  @override
  String get analysisResult => 'Analysis Result';

  @override
  String get tie => 'It\'s a tie!';

  @override
  String get tieDescription => 'Multiple choices received similar scores';

  @override
  String get totalScoreComparison => 'Total Score Comparison';

  @override
  String get points => 'points';

  @override
  String get detailedAnalysis => 'Detailed Analysis';

  @override
  String get language => 'Language';

  @override
  String get korean => '한국어';

  @override
  String get english => 'English';

  @override
  String get oracleCard1Name => 'Birth';

  @override
  String get oracleCard1Text => 'YES';

  @override
  String get oracleCard1Percentage => '100%';

  @override
  String get oracleCard1Description =>
      'The Birth card blessed by the sun represents the beginning and start of all things. What is meant to be will surely come to pass.';

  @override
  String get oracleCard2Name => 'Rising';

  @override
  String get oracleCard2Text => 'YES';

  @override
  String get oracleCard2Percentage => '100%';

  @override
  String get oracleCard2Description =>
      'The Rising card shows that victory will follow in what you do.';

  @override
  String get oracleCard3Name => 'Honor';

  @override
  String get oracleCard3Text => 'YES';

  @override
  String get oracleCard3Percentage => '100%';

  @override
  String get oracleCard3Description =>
      'The Honor card shows that the question will soon elevate your reputation.';

  @override
  String get oracleCard4Name => 'Leadership';

  @override
  String get oracleCard4Text => 'YES';

  @override
  String get oracleCard4Percentage => '84%';

  @override
  String get oracleCard4Description =>
      'The Leadership card shows your position is solid. It indicates the question will go in a positive direction.';

  @override
  String get oracleCard5Name => 'Depression';

  @override
  String get oracleCard5Text => 'NO';

  @override
  String get oracleCard5Percentage => '73%';

  @override
  String get oracleCard5Description =>
      'The Depression card shows increasing worries. The direction of the question may flow toward the negative.';

  @override
  String get oracleCard6Name => 'Fickleness/Instability';

  @override
  String get oracleCard6Text => 'NO';

  @override
  String get oracleCard6Percentage => '86%';

  @override
  String get oracleCard6Description =>
      'The Fickleness card shows an unstable state. The future of the question may become unclear.';

  @override
  String get oracleCard7Name => 'Family';

  @override
  String get oracleCard7Text => 'YES';

  @override
  String get oracleCard7Percentage => '80%';

  @override
  String get oracleCard7Description =>
      'The Family card shows you are within a strong support system. The future of the question can be seen as stable.';

  @override
  String get oracleCard8Name => 'Mother';

  @override
  String get oracleCard8Text => 'YES';

  @override
  String get oracleCard8Percentage => '90%';

  @override
  String get oracleCard8Description =>
      'The Mother card is like a mother who always embraces you warmly. The question may flow in a positive direction.';

  @override
  String get oracleCard9Name => 'Illness';

  @override
  String get oracleCard9Text => 'NO';

  @override
  String get oracleCard9Percentage => '94%';

  @override
  String get oracleCard9Description =>
      'The Illness card shows that things will not proceed as intended. The result may not be good.';

  @override
  String get oracleCard10Name => 'Change';

  @override
  String get oracleCard10Text => 'NO';

  @override
  String get oracleCard10Percentage => '56%';

  @override
  String get oracleCard10Description =>
      'The Change card suggests transformation. While change can be positive if handled well, it\'s generally negative.';

  @override
  String get oracleCard11Name => 'Intelligence';

  @override
  String get oracleCard11Text => 'YES';

  @override
  String get oracleCard11Percentage => '73%';

  @override
  String get oracleCard11Description =>
      'The Intelligence card is quite positive. You can solve problems by exercising your intelligence.';

  @override
  String get oracleCard12Name => 'Theft';

  @override
  String get oracleCard12Text => 'NO';

  @override
  String get oracleCard12Percentage => '95%';

  @override
  String get oracleCard12Description =>
      'The Theft card is negative. Contrary to your thoughts, you may be frustrated by others\' negative actions.';

  @override
  String get oracleCard13Name => 'Trade';

  @override
  String get oracleCard13Text => 'YES';

  @override
  String get oracleCard13Percentage => '64%';

  @override
  String get oracleCard13Description =>
      'The Trade card is quite positive. Negotiations may occur, but you can compromise in a positive direction.';

  @override
  String get oracleCard14Name => 'Joy';

  @override
  String get oracleCard14Text => 'YES';

  @override
  String get oracleCard14Percentage => '82%';

  @override
  String get oracleCard14Description =>
      'The Joy card is quite positive. Regardless of the outcome, happiness and joy will follow.';

  @override
  String get oracleCard15Name => 'Peace';

  @override
  String get oracleCard15Text => 'YES';

  @override
  String get oracleCard15Percentage => '100%';

  @override
  String get oracleCard15Description =>
      'The Peace card is very positive. The result will eventually conclude in a positive direction and peace will come.';

  @override
  String get oracleCard16Name => 'Money';

  @override
  String get oracleCard16Text => 'YES';

  @override
  String get oracleCard16Percentage => '88%';

  @override
  String get oracleCard16Description =>
      'The Money card is close to positive. Financial solutions or monetary returns may occur.';

  @override
  String get oracleCard17Name => 'Love';

  @override
  String get oracleCard17Text => 'YES';

  @override
  String get oracleCard17Percentage => '100%';

  @override
  String get oracleCard17Description =>
      'The Love card is positive. If it was a love-related question, it will lead to a loving union.';

  @override
  String get oracleCard18Name => 'Food and Drink';

  @override
  String get oracleCard18Text => 'YES';

  @override
  String get oracleCard18Percentage => '88%';

  @override
  String get oracleCard18Description =>
      'The Food and Drink card is positive. It will lead to enjoyable times with delicious food and drinks.';

  @override
  String get oracleCard19Name => 'Malice';

  @override
  String get oracleCard19Text => 'NO';

  @override
  String get oracleCard19Percentage => '100%';

  @override
  String get oracleCard19Description =>
      'The Malice card is negative. Contrary to your intentions, you may be frustrated by others\' interference or malice.';

  @override
  String get oracleCard20Name => 'War';

  @override
  String get oracleCard20Text => 'NO';

  @override
  String get oracleCard20Percentage => '100%';

  @override
  String get oracleCard20Description =>
      'The War card is negative. Conflicts, fights, and misunderstandings may occur.';

  @override
  String get oracleCard21Name => 'Enemy';

  @override
  String get oracleCard21Text => 'NO';

  @override
  String get oracleCard21Percentage => '100%';

  @override
  String get oracleCard21Description =>
      'The Enemy card is negative. There may be enemies nearby who harm or plot against you.';

  @override
  String get oracleCard22Name => 'Fire/Disaster';

  @override
  String get oracleCard22Text => 'NO';

  @override
  String get oracleCard22Percentage => '100%';

  @override
  String get oracleCard22Description =>
      'The Disaster card is negative. You may be frustrated by unexpected disasters and external variables.';

  @override
  String get oracleCard23Name => 'Accident';

  @override
  String get oracleCard23Text => 'NO';

  @override
  String get oracleCard23Percentage => '100%';

  @override
  String get oracleCard23Description =>
      'The Accident card is negative. Sudden issues may arise.';

  @override
  String get oracleCard24Name => 'Support/Patronage';

  @override
  String get oracleCard24Text => 'YES';

  @override
  String get oracleCard24Percentage => '70%';

  @override
  String get oracleCard24Description =>
      'The Reflection card is positive. Through self-reflection, you can move toward a better future.';

  @override
  String get oracleCard25Name => 'Good Opportunity';

  @override
  String get oracleCard25Text => 'YES';

  @override
  String get oracleCard25Percentage => '100%';

  @override
  String get oracleCard25Description =>
      'The Good Opportunity card is very positive. Unexpected good opportunities may be waiting nearby.';

  @override
  String get oracleCard26Name => 'Fame';

  @override
  String get oracleCard26Text => 'YES';

  @override
  String get oracleCard26Percentage => '100%';

  @override
  String get oracleCard26Description =>
      'The Fame card is very positive. Positive events may occur where your good news and reputation rise.';

  @override
  String get oracleCard27Name => 'Misfortune';

  @override
  String get oracleCard27Text => 'NO';

  @override
  String get oracleCard27Percentage => '100%';

  @override
  String get oracleCard27Description =>
      'The Misfortune card is negative. Misfortune may come regardless of your mistakes or faults.';

  @override
  String get oracleCard28Name => 'Tragedy';

  @override
  String get oracleCard28Text => 'NO';

  @override
  String get oracleCard28Percentage => '100%';

  @override
  String get oracleCard28Description =>
      'The Tragedy card is negative. As the name suggests, it may lead to a tragic conclusion, so caution is needed.';

  @override
  String get oracleCard29Name => 'Destruction';

  @override
  String get oracleCard29Text => 'NO';

  @override
  String get oracleCard29Percentage => '100%';

  @override
  String get oracleCard29Description =>
      'The Destruction card is negative. As the name suggests, it may end in destruction.';

  @override
  String get oracleCard30Name => 'Delay/Suffering';

  @override
  String get oracleCard30Text => 'NO';

  @override
  String get oracleCard30Percentage => '60%';

  @override
  String get oracleCard30Description =>
      'The Delay card is quite negative. There may be delays and obstacles in your work.';

  @override
  String get oracleCard31Name => 'Isolation';

  @override
  String get oracleCard31Text => 'NO';

  @override
  String get oracleCard31Percentage => '70%';

  @override
  String get oracleCard31Description =>
      'The Isolation card is quite negative. You may spend lonely and solitary time in isolation.';

  @override
  String get oracleCard32Name => 'Conversation/Humor';

  @override
  String get oracleCard32Text => 'YES';

  @override
  String get oracleCard32Percentage => '80%';

  @override
  String get oracleCard32Description =>
      'The Humor card is quite positive. There may be times to have pleasant conversations and laughter with someone.';

  @override
  String get oracleCard33Name => 'Wisdom';

  @override
  String get oracleCard33Text => 'YES';

  @override
  String get oracleCard33Percentage => '89%';

  @override
  String get oracleCard33Description =>
      'The Wisdom card shows that you can overcome difficulties and obstacles with wisdom. It\'s positive.';

  @override
  String get oracleCard34Name => 'Happiness';

  @override
  String get oracleCard34Text => 'YES';

  @override
  String get oracleCard34Percentage => '100%';

  @override
  String get oracleCard34Description =>
      'The Happiness card shows that feelings of happiness will soon come. Happiness is not far away.';

  @override
  String get oracleCard35Name => 'Healthy Values';

  @override
  String get oracleCard35Text => 'YES';

  @override
  String get oracleCard35Percentage => '84%';

  @override
  String get oracleCard35Description =>
      'It shows that you can overcome and conquer difficulties with the healthy values deeply rooted in your heart. It\'s very positive.';
}
