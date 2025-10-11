import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/providers/locale_provider.dart';
import 'features/concern/models/concern.dart';
import 'features/concern/models/analysis_result.dart';
import 'features/logical_framework/models/comparison_item.dart';
import 'features/logical_framework/models/logical_framework.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Hive 초기화
  await Hive.initFlutter();

  // Adapter 등록
  Hive.registerAdapter(ConcernAdapter());
  Hive.registerAdapter(AnalysisResultAdapter());
  Hive.registerAdapter(ComparisonItemAdapter());
  Hive.registerAdapter(LogicalFrameworkAdapter());

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeState = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Choicely',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
      locale: localeState.currentLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko', 'KR'), Locale('en', 'US')],
    );
  }
}
