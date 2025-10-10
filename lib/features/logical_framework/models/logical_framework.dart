import 'package:hive/hive.dart';

part 'logical_framework.g.dart';

/// 논리 프레임워크 모델
@HiveType(typeId: 2)
class LogicalFramework extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String concernId;

  @HiveField(2)
  late String optionAName; // A 선택지 이름 (하위 호환성 유지)

  @HiveField(3)
  late String optionBName; // B 선택지 이름 (하위 호환성 유지)

  @HiveField(4)
  late List<String> comparisonItemIds; // ComparisonItem ID 목록

  @HiveField(5)
  late DateTime createdAt;

  @HiveField(6)
  late DateTime updatedAt;

  LogicalFramework({
    required this.id,
    required this.concernId,
    this.optionAName = '', // 이제 concern의 choices를 사용
    this.optionBName = '', // 이제 concern의 choices를 사용
    required this.comparisonItemIds,
    required this.createdAt,
    required this.updatedAt,
  });

  LogicalFramework copyWith({
    String? id,
    String? concernId,
    String? optionAName,
    String? optionBName,
    List<String>? comparisonItemIds,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LogicalFramework(
      id: id ?? this.id,
      concernId: concernId ?? this.concernId,
      optionAName: optionAName ?? this.optionAName,
      optionBName: optionBName ?? this.optionBName,
      comparisonItemIds: comparisonItemIds ?? this.comparisonItemIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
