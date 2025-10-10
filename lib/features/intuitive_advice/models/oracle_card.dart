/// 오라클 카드 모델
class OracleCard {
  final int id;
  final String name;
  final String nameKo;
  final String description;
  final String message;
  final String image;
  final String fortune; // 'excellent', 'good', 'neutral', 'caution'
  final int fortuneScore; // 1-10 (높을수록 길함)

  const OracleCard({
    required this.id,
    required this.name,
    required this.nameKo,
    required this.description,
    required this.message,
    required this.image,
    required this.fortune,
    required this.fortuneScore,
  });
}
