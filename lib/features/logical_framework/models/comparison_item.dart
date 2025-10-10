import 'package:hive/hive.dart';

part 'comparison_item.g.dart';

/// 비교 항목 모델 (예: 연봉, 워라밸, 성장 가능성 등)
@HiveType(typeId: 1)
class ComparisonItem extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late double weight; // 가중치 (1-10)

  @HiveField(3)
  late double scoreA; // A 선택지 점수 (호환성 유지)

  @HiveField(4)
  late double scoreB; // B 선택지 점수 (호환성 유지)

  @HiveField(5)
  late Map<dynamic, dynamic> scores; // 선택지별 점수 (index -> score)

  ComparisonItem({
    required this.id,
    required this.name,
    required this.weight,
    this.scoreA = 0,
    this.scoreB = 0,
    Map<int, double>? scores,
  }) : scores = scores ?? {};

  // 특정 선택지의 점수 가져오기
  double getScore(int choiceIndex) {
    final score = scores[choiceIndex];
    if (score is num) {
      return score.toDouble();
    }
    return 0.0;
  }

  // 특정 선택지의 가중치 적용 점수 가져오기
  double getWeightedScore(int choiceIndex) {
    return getScore(choiceIndex) * weight;
  }

  // 선택지별 점수 설정
  void setScore(int choiceIndex, double score) {
    scores[choiceIndex] = score;
  }

  // 가중치가 적용된 점수 계산 (하위 호환성)
  double get weightedScoreA => scoreA * weight;
  double get weightedScoreB => scoreB * weight;

  ComparisonItem copyWith({
    String? id,
    String? name,
    double? weight,
    double? scoreA,
    double? scoreB,
    Map<int, double>? scores,
  }) {
    return ComparisonItem(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      scoreA: scoreA ?? this.scoreA,
      scoreB: scoreB ?? this.scoreB,
      scores:
          scores ??
          Map<int, double>.from(
            this.scores.map(
              (k, v) => MapEntry(k as int, (v as num).toDouble()),
            ),
          ),
    );
  }
}
