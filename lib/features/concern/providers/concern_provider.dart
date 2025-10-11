import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../models/concern.dart';

/// Concern Box Provider
final concernBoxProvider = FutureProvider<Box<Concern>>((ref) async {
  return await Hive.openBox<Concern>('concerns');
});

/// Concern 리스트 Provider
final concernListProvider =
    StateNotifierProvider<ConcernNotifier, AsyncValue<List<Concern>>>((ref) {
      return ConcernNotifier(ref);
    });

class ConcernNotifier extends StateNotifier<AsyncValue<List<Concern>>> {
  final Ref ref;
  final _uuid = const Uuid();

  ConcernNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadConcerns();
  }

  Future<void> _loadConcerns() async {
    try {
      final box = await ref.read(concernBoxProvider.future);
      final concerns = box.values.toList();
      // createdAt 기준으로 내림차순 정렬
      concerns.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      state = AsyncValue.data(concerns);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// 고민 추가
  Future<void> addConcern({
    required String title,
    required String description,
    required List<String> choices,
    String? templateId,
  }) async {
    try {
      final box = await ref.read(concernBoxProvider.future);
      final now = DateTime.now();

      final concern = Concern(
        id: _uuid.v4(),
        title: title,
        description: description,
        createdAt: now,
        updatedAt: now,
        status: ConcernStatus.active.name,
        choices: choices,
        templateId: templateId,
      );

      await box.put(concern.id, concern);
      await _loadConcerns();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// 고민 수정
  Future<void> updateConcern(Concern concern) async {
    try {
      final box = await ref.read(concernBoxProvider.future);
      final updatedConcern = concern.copyWith(updatedAt: DateTime.now());
      await box.put(updatedConcern.id, updatedConcern);
      await _loadConcerns();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// 고민 삭제
  Future<void> deleteConcern(String id) async {
    try {
      final box = await ref.read(concernBoxProvider.future);
      await box.delete(id);
      await _loadConcerns();
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// 고민 상태 변경
  Future<void> updateStatus(String id, ConcernStatus status) async {
    try {
      final box = await ref.read(concernBoxProvider.future);
      final concern = box.get(id);
      if (concern != null) {
        final updatedConcern = concern.copyWith(
          status: status.name,
          updatedAt: DateTime.now(),
        );
        await box.put(id, updatedConcern);
        await _loadConcerns();
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  /// ID로 고민 가져오기
  Concern? getConcernById(String id) {
    return state.value?.firstWhere((c) => c.id == id);
  }

  /// 최종 선택 완료
  Future<void> finalizeConcern(String id, int selectedChoiceIndex) async {
    try {
      final box = await ref.read(concernBoxProvider.future);
      final concern = box.get(id);
      if (concern != null) {
        final updatedConcern = concern.copyWith(
          status: ConcernStatus.resolved.name,
          selectedChoiceIndex: selectedChoiceIndex,
          updatedAt: DateTime.now(),
        );
        await box.put(id, updatedConcern);
        await _loadConcerns();
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
