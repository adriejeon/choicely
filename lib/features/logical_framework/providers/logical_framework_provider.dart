import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../models/logical_framework.dart';
import '../models/comparison_item.dart';

/// LogicalFramework Box Provider
final logicalFrameworkBoxProvider = FutureProvider<Box<LogicalFramework>>((
  ref,
) async {
  return await Hive.openBox<LogicalFramework>('logical_frameworks');
});

/// ComparisonItem Box Provider
final comparisonItemBoxProvider = FutureProvider<Box<ComparisonItem>>((
  ref,
) async {
  return await Hive.openBox<ComparisonItem>('comparison_items');
});

/// LogicalFramework Provider
final logicalFrameworkProvider =
    StateNotifierProvider.family<
      LogicalFrameworkNotifier,
      AsyncValue<LogicalFramework?>,
      String
    >((ref, concernId) {
      return LogicalFrameworkNotifier(ref, concernId);
    });

class LogicalFrameworkNotifier
    extends StateNotifier<AsyncValue<LogicalFramework?>> {
  final Ref ref;
  final String concernId;
  final _uuid = const Uuid();

  LogicalFrameworkNotifier(this.ref, this.concernId)
    : super(const AsyncValue.loading()) {
    _loadFramework();
  }

  Future<void> _loadFramework() async {
    try {
      final box = await ref.read(logicalFrameworkBoxProvider.future);
      final framework = box.values.firstWhere(
        (f) => f.concernId == concernId,
        orElse: () => LogicalFramework(
          id: '',
          concernId: concernId,
          optionAName: '',
          optionBName: '',
          comparisonItemIds: [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );

      if (framework.id.isEmpty) {
        state = const AsyncValue.data(null);
      } else {
        state = AsyncValue.data(framework);
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// 프레임워크 생성 또는 업데이트
  Future<void> createOrUpdateFramework() async {
    try {
      final box = await ref.read(logicalFrameworkBoxProvider.future);
      final now = DateTime.now();

      LogicalFramework framework;
      if (state.value == null || state.value!.id.isEmpty) {
        // 새로 생성
        framework = LogicalFramework(
          id: _uuid.v4(),
          concernId: concernId,
          comparisonItemIds: [],
          createdAt: now,
          updatedAt: now,
        );
      } else {
        // 업데이트
        framework = state.value!.copyWith(updatedAt: now);
      }

      await box.put(framework.id, framework);
      state = AsyncValue.data(framework);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// 비교 항목 추가
  Future<void> addComparisonItem({
    required String name,
    required double weight,
  }) async {
    try {
      if (state.value == null) return;

      final itemBox = await ref.read(comparisonItemBoxProvider.future);
      final frameworkBox = await ref.read(logicalFrameworkBoxProvider.future);

      final item = ComparisonItem(
        id: _uuid.v4(),
        name: name,
        weight: weight,
        scoreA: 0,
        scoreB: 0,
      );

      await itemBox.put(item.id, item);

      final updatedFramework = state.value!.copyWith(
        comparisonItemIds: [...state.value!.comparisonItemIds, item.id],
        updatedAt: DateTime.now(),
      );

      await frameworkBox.put(updatedFramework.id, updatedFramework);
      state = AsyncValue.data(updatedFramework);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// 비교 항목 수정
  Future<void> updateComparisonItem(ComparisonItem item) async {
    try {
      final box = await ref.read(comparisonItemBoxProvider.future);
      await box.put(item.id, item);
      await _loadFramework();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// 비교 항목 삭제
  Future<void> deleteComparisonItem(String itemId) async {
    try {
      if (state.value == null) return;

      final itemBox = await ref.read(comparisonItemBoxProvider.future);
      final frameworkBox = await ref.read(logicalFrameworkBoxProvider.future);

      await itemBox.delete(itemId);

      final updatedItemIds = state.value!.comparisonItemIds
          .where((id) => id != itemId)
          .toList();

      final updatedFramework = state.value!.copyWith(
        comparisonItemIds: updatedItemIds,
        updatedAt: DateTime.now(),
      );

      await frameworkBox.put(updatedFramework.id, updatedFramework);
      state = AsyncValue.data(updatedFramework);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// 비교 항목들 가져오기
  Future<List<ComparisonItem>> getComparisonItems() async {
    if (state.value == null) return [];

    final box = await ref.read(comparisonItemBoxProvider.future);
    final items = <ComparisonItem>[];

    for (final itemId in state.value!.comparisonItemIds) {
      final item = box.get(itemId);
      if (item != null) {
        items.add(item);
      }
    }

    return items;
  }

  /// 총점 계산
  Future<Map<String, double>> calculateTotalScores() async {
    final items = await getComparisonItems();

    double totalA = 0;
    double totalB = 0;

    for (final item in items) {
      totalA += item.weightedScoreA;
      totalB += item.weightedScoreB;
    }

    return {'totalA': totalA, 'totalB': totalB};
  }
}
