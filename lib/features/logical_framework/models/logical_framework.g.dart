// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logical_framework.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LogicalFrameworkAdapter extends TypeAdapter<LogicalFramework> {
  @override
  final int typeId = 2;

  @override
  LogicalFramework read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LogicalFramework(
      id: fields[0] as String,
      concernId: fields[1] as String,
      optionAName: fields[2] as String,
      optionBName: fields[3] as String,
      comparisonItemIds: (fields[4] as List).cast<String>(),
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, LogicalFramework obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.concernId)
      ..writeByte(2)
      ..write(obj.optionAName)
      ..writeByte(3)
      ..write(obj.optionBName)
      ..writeByte(4)
      ..write(obj.comparisonItemIds)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogicalFrameworkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
