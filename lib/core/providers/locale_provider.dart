import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleState {
  final Locale currentLocale;
  final bool isLoading;

  const LocaleState({
    this.currentLocale = const Locale('ko', 'KR'),
    this.isLoading = false,
  });

  LocaleState copyWith({Locale? currentLocale, bool? isLoading}) {
    return LocaleState(
      currentLocale: currentLocale ?? this.currentLocale,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class LocaleNotifier extends StateNotifier<LocaleState> {
  LocaleNotifier() : super(const LocaleState()) {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    state = state.copyWith(isLoading: true);

    try {
      // 간단한 메모리 기반 저장 (실제 앱에서는 SharedPreferences 사용)
      state = state.copyWith(
        currentLocale: const Locale('ko', 'KR'),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        currentLocale: const Locale('ko', 'KR'),
        isLoading: false,
      );
    }
  }

  Future<void> changeLocale(Locale newLocale) async {
    state = state.copyWith(isLoading: true);

    try {
      // 간단한 메모리 기반 저장 (실제 앱에서는 SharedPreferences 사용)
      state = state.copyWith(currentLocale: newLocale, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  void toggleLocale() {
    final newLocale = state.currentLocale.languageCode == 'ko'
        ? const Locale('en', 'US')
        : const Locale('ko', 'KR');
    changeLocale(newLocale);
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, LocaleState>((
  ref,
) {
  return LocaleNotifier();
});
