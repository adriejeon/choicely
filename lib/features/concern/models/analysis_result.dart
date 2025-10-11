import 'package:hive/hive.dart';
import 'dart:convert';

part 'analysis_result.g.dart';

@HiveType(typeId: 4)
class AnalysisResult extends HiveObject {
  @HiveField(0)
  final String concernId;

  @HiveField(1)
  final String type; // 'logical' or 'intuitive'

  @HiveField(2)
  final String dataJson; // JSON 문자열로 저장

  @HiveField(3)
  final DateTime createdAt;

  AnalysisResult({
    required this.concernId,
    required this.type,
    required this.dataJson,
    required this.createdAt,
  });

  // data getter - JSON을 Map으로 변환
  Map<String, dynamic> get data {
    try {
      return jsonDecode(dataJson);
    } catch (e) {
      print('❌ [ANALYSIS_RESULT] Error decoding JSON: $e');
      print('❌ [ANALYSIS_RESULT] JSON string: $dataJson');
      return {};
    }
  }

  factory AnalysisResult.logical({
    required String concernId,
    required Map<String, dynamic> logicalData,
  }) {
    try {
      // Map 객체를 JSON 직렬화 가능한 형태로 변환
      final serializableData = _makeSerializable(logicalData);
      return AnalysisResult(
        concernId: concernId,
        type: 'logical',
        dataJson: jsonEncode(serializableData),
        createdAt: DateTime.now(),
      );
    } catch (e) {
      print('❌ [ANALYSIS_RESULT] Error encoding logical data: $e');
      print('❌ [ANALYSIS_RESULT] Logical data: $logicalData');
      return AnalysisResult(
        concernId: concernId,
        type: 'logical',
        dataJson: '{}',
        createdAt: DateTime.now(),
      );
    }
  }

  factory AnalysisResult.intuitive({
    required String concernId,
    required Map<String, dynamic> intuitiveData,
  }) {
    try {
      // Map 객체를 JSON 직렬화 가능한 형태로 변환
      final serializableData = _makeSerializable(intuitiveData);
      return AnalysisResult(
        concernId: concernId,
        type: 'intuitive',
        dataJson: jsonEncode(serializableData),
        createdAt: DateTime.now(),
      );
    } catch (e) {
      print('❌ [ANALYSIS_RESULT] Error encoding intuitive data: $e');
      print('❌ [ANALYSIS_RESULT] Intuitive data: $intuitiveData');
      return AnalysisResult(
        concernId: concernId,
        type: 'intuitive',
        dataJson: '{}',
        createdAt: DateTime.now(),
      );
    }
  }

  /// Map 객체를 JSON 직렬화 가능한 형태로 변환
  static Map<String, dynamic> _makeSerializable(Map<String, dynamic> data) {
    final result = <String, dynamic>{};

    for (final entry in data.entries) {
      final key = entry.key;
      final value = entry.value;

      if (value is Map<int, int>) {
        // Map<int, int>를 Map<String, String>으로 변환
        result[key] = value.map((k, v) => MapEntry(k.toString(), v.toString()));
      } else if (value is Map<int, double>) {
        // Map<int, double>를 Map<String, String>으로 변환
        result[key] = value.map((k, v) => MapEntry(k.toString(), v.toString()));
      } else if (value is Map<int, Map<String, String>>) {
        // Map<int, Map<String, String>>를 Map<String, Map<String, String>>으로 변환
        result[key] = value.map((k, v) => MapEntry(k.toString(), v));
      } else if (value is Map<int, String>) {
        // Map<int, String>을 Map<String, String>으로 변환
        result[key] = value.map((k, v) => MapEntry(k.toString(), v));
      } else if (value is List) {
        // List 내부의 Map도 변환
        result[key] = value.map((item) {
          if (item is Map<String, dynamic>) {
            return _makeSerializable(item);
          }
          return item;
        }).toList();
      } else {
        result[key] = value;
      }
    }

    return result;
  }
}
