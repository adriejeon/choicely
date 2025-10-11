import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/analysis_result.dart';

class AnalysisResultNotifier extends StateNotifier<List<AnalysisResult>> {
  AnalysisResultNotifier() : super([]) {
    _loadResults();
  }

  static const String _boxName = 'analysis_results_v2';

  Future<void> _loadResults() async {
    try {
      final box = await Hive.openBox<AnalysisResult>(_boxName);
      final results = box.values.toList();
      if (mounted) {
        state = results;
      }
    } catch (e) {
      print('❌ [LOAD] Error loading results: $e');
      if (mounted) {
        state = [];
      }
    }
  }

  Future<void> saveLogicalResult({
    required String concernId,
    required Map<String, dynamic> logicalData,
  }) async {
    try {
      final box = await Hive.openBox<AnalysisResult>(_boxName);

      // 기존 논리 분석 결과가 있으면 제거
      final existingResults = box.values
          .where(
            (result) =>
                result.concernId == concernId && result.type == 'logical',
          )
          .toList();

      for (final result in existingResults) {
        await result.delete();
      }

      // 새로운 결과 저장
      final newResult = AnalysisResult.logical(
        concernId: concernId,
        logicalData: logicalData,
      );

      await box.add(newResult);
      await _loadResults();
    } catch (e) {
      print('❌ [LOGICAL] Error saving result: $e');
    }
  }

  Future<void> saveIntuitiveResult({
    required String concernId,
    required Map<String, dynamic> intuitiveData,
  }) async {
    try {
      final box = await Hive.openBox<AnalysisResult>(_boxName);

      // 기존 직관 분석 결과가 있으면 제거
      final existingResults = box.values
          .where(
            (result) =>
                result.concernId == concernId && result.type == 'intuitive',
          )
          .toList();

      for (final result in existingResults) {
        await result.delete();
      }

      // 새로운 결과 저장
      final newResult = AnalysisResult.intuitive(
        concernId: concernId,
        intuitiveData: intuitiveData,
      );

      await box.add(newResult);
      await _loadResults();
    } catch (e) {
      print('❌ [INTUITIVE] Error saving result: $e');
    }
  }

  AnalysisResult? getLogicalResult(String concernId) {
    return state
        .where(
          (result) => result.concernId == concernId && result.type == 'logical',
        )
        .firstOrNull;
  }

  AnalysisResult? getIntuitiveResult(String concernId) {
    return state
        .where(
          (result) =>
              result.concernId == concernId && result.type == 'intuitive',
        )
        .firstOrNull;
  }

  Future<void> clearResult(String concernId, String type) async {
    try {
      final box = await Hive.openBox<AnalysisResult>(_boxName);
      final results = box.values
          .where(
            (result) => result.concernId == concernId && result.type == type,
          )
          .toList();

      for (final result in results) {
        await result.delete();
      }

      await _loadResults();
    } catch (e) {
      // 에러 처리
    }
  }

  /// 분석 결과 새로고침
  Future<void> refreshResults() async {
    await _loadResults();
  }
}

final analysisResultProvider =
    StateNotifierProvider<AnalysisResultNotifier, List<AnalysisResult>>(
      (ref) => AnalysisResultNotifier(),
    );
