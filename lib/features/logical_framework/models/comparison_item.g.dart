// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparison_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComparisonItemAdapter extends TypeAdapter<ComparisonItem> {
  @override
  final int typeId = 1;

  @override
  ComparisonItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ComparisonItem(
      id: fields[0] as String,
      name: fields[1] as String,
      weight: fields[2] as double,
      scoreA: fields[3] as double,
      scoreB: fields[4] as double,
      scores: (fields[5] as Map?)?.cast<int, double>(),
    );
  }

  @override
  void write(BinaryWriter writer, ComparisonItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.scoreA)
      ..writeByte(4)
      ..write(obj.scoreB)
      ..writeByte(5)
      ..write(obj.scores);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComparisonItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
