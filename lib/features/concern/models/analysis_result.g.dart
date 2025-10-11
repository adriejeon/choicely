// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnalysisResultAdapter extends TypeAdapter<AnalysisResult> {
  @override
  final int typeId = 4;

  @override
  AnalysisResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnalysisResult(
      concernId: fields[0] as String,
      type: fields[1] as String,
      dataJson: fields[2] as String,
      createdAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AnalysisResult obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.concernId)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.dataJson)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalysisResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
