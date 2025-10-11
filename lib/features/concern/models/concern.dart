import 'package:hive/hive.dart';

part 'concern.g.dart';

/// 고민 상태
enum ConcernStatus {
  active, // 진행 중
  resolved, // 해결 완료
  archived, // 보관
}

/// 고민 모델
@HiveType(typeId: 0)
class Concern extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late DateTime createdAt;

  @HiveField(4)
  late DateTime updatedAt;

  @HiveField(5)
  late String status; // ConcernStatus를 String으로 저장

  @HiveField(6)
  String? logicalFrameworkId;

  @HiveField(7)
  String? intuitiveAdviceId;

  @HiveField(8)
  late List<String> choices; // 선택지 리스트 (1~4개)

  @HiveField(9)
  int? selectedChoiceIndex; // 최종 선택한 선택지 인덱스

  @HiveField(10)
  String? templateId; // 사용된 템플릿 ID

  Concern({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    this.logicalFrameworkId,
    this.intuitiveAdviceId,
    List<String>? choices,
    this.selectedChoiceIndex,
    this.templateId,
  }) : choices = choices ?? [];

  // Status getter/setter
  ConcernStatus get statusEnum {
    switch (status) {
      case 'active':
        return ConcernStatus.active;
      case 'resolved':
        return ConcernStatus.resolved;
      case 'archived':
        return ConcernStatus.archived;
      default:
        return ConcernStatus.active;
    }
  }

  set statusEnum(ConcernStatus value) {
    status = value.name;
  }

  // 복사본 생성
  Concern copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? status,
    String? logicalFrameworkId,
    String? intuitiveAdviceId,
    List<String>? choices,
    int? selectedChoiceIndex,
    String? templateId,
  }) {
    return Concern(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      logicalFrameworkId: logicalFrameworkId ?? this.logicalFrameworkId,
      intuitiveAdviceId: intuitiveAdviceId ?? this.intuitiveAdviceId,
      choices: choices ?? this.choices,
      selectedChoiceIndex: selectedChoiceIndex ?? this.selectedChoiceIndex,
      templateId: templateId ?? this.templateId,
    );
  }
}
