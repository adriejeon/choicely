// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concern.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConcernAdapter extends TypeAdapter<Concern> {
  @override
  final int typeId = 0;

  @override
  Concern read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Concern(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      createdAt: fields[3] as DateTime,
      updatedAt: fields[4] as DateTime,
      status: fields[5] as String,
      logicalFrameworkId: fields[6] as String?,
      intuitiveAdviceId: fields[7] as String?,
      choices: (fields[8] as List?)?.cast<String>(),
      selectedChoiceIndex: fields[9] as int?,
      templateId: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Concern obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.logicalFrameworkId)
      ..writeByte(7)
      ..write(obj.intuitiveAdviceId)
      ..writeByte(8)
      ..write(obj.choices)
      ..writeByte(9)
      ..write(obj.selectedChoiceIndex)
      ..writeByte(10)
      ..write(obj.templateId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConcernAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
