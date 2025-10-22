import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

/// 공유 서비스 클래스
class ShareService {
  static const String _appDownloadLink = 'https://onelink.to/6m2v9r';
  static const String _intuitiveShareLink = 'https://adriejeon.github.io/choicelyPolicy/share.html';
  static const String _logicalShareLink = 'https://adriejeon.github.io/choicelyPolicy/share-logical.html';

  /// 직관 분석 결과 공유하기 - 배달의민족 방식
  static Future<void> shareIntuitiveAnalysis({
    required String concernTitle,
    required String optionName,
    required String tarotCardName,
    required String analysisResult,
    required BuildContext context,
  }) async {
    final locale = Localizations.localeOf(context);
    final isKorean = locale.languageCode == 'ko';

    // 텍스트 메시지 생성 (썸네일이 포함된 링크 사용)
    final message = isKorean
        ? '🔮 Choicely - 직관적 분석\n\n고민: $concernTitle\n선택지: $optionName\n\n타로 카드: $tarotCardName\n\n$analysisResult\n\n결과 확인하기: $_intuitiveShareLink'
        : '🔮 Choicely - Intuitive Analysis\n\nConcern: $concernTitle\nOption: $optionName\n\nTarot Card: $tarotCardName\n\n$analysisResult\n\nCheck Results: $_intuitiveShareLink';

    // share_plus를 사용하여 공유 (배달의민족 방식)
    await Share.share(message);
  }


  /// 논리적 프레임워크 분석 결과 공유하기 - 배달의민족 방식
  static Future<void> shareLogicalFrameworkAnalysis({
    required String concernTitle,
    required String topOptionName,
    required double topOptionScore,
    required BuildContext context,
  }) async {
    final locale = Localizations.localeOf(context);
    final isKorean = locale.languageCode == 'ko';

    // 텍스트 메시지 생성 (썸네일이 포함된 링크 사용)
    final message = isKorean
        ? '📊 Choicely - 논리적 분석\n\n고민: $concernTitle\n\n최고 점수 선택지: $topOptionName\n점수: ${topOptionScore.toStringAsFixed(1)}점\n\n결과 확인하기: $_logicalShareLink'
        : '📊 Choicely - Logical Analysis\n\nConcern: $concernTitle\n\nTop Option: $topOptionName\nScore: ${topOptionScore.toStringAsFixed(1)} points\n\nCheck Results: $_logicalShareLink';

    // share_plus를 사용하여 공유 (배달의민족 방식)
    await Share.share(message);
  }

}

