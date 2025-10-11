import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/concern/screens/concern_list_screen.dart';
import '../../features/concern/screens/concern_detail_screen.dart';
import '../../features/concern/screens/add_concern_screen.dart';
import '../../features/concern/screens/template_selection_screen.dart';
import '../../features/concern/models/concern_template.dart';
import '../../features/logical_framework/screens/logical_framework_screen.dart';
import '../../features/logical_framework/screens/comparison_setup_screen.dart';
import '../../features/logical_framework/screens/scoring_screen.dart';
import '../../features/logical_framework/screens/result_screen.dart';
import '../../features/intuitive_advice/screens/tarot_screen.dart';
import '../../features/intuitive_advice/screens/tarot_card_selection_screen.dart';

/// 앱 라우터
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      // 홈 - 고민 목록
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) =>
            _buildPageWithAnimation(context, state, const ConcernListScreen()),
      ),

      // 템플릿 선택
      GoRoute(
        path: '/template-selection',
        name: 'template-selection',
        pageBuilder: (context, state) => _buildPageWithAnimation(
          context,
          state,
          const TemplateSelectionScreen(),
        ),
      ),

      // 고민 추가
      GoRoute(
        path: '/add-concern',
        name: 'add-concern',
        pageBuilder: (context, state) {
          final template = state.extra as ConcernTemplate?;
          return _buildPageWithAnimation(
            context,
            state,
            AddConcernScreen(template: template),
          );
        },
      ),

      // 고민 상세
      GoRoute(
        path: '/concern/:id',
        name: 'concern-detail',
        pageBuilder: (context, state) {
          final concernId = state.pathParameters['id']!;
          return _buildPageWithAnimation(
            context,
            state,
            ConcernDetailScreen(concernId: concernId),
          );
        },
      ),

      // 논리 프레임워크
      GoRoute(
        path: '/concern/:id/logical-framework',
        name: 'logical-framework',
        pageBuilder: (context, state) {
          final concernId = state.pathParameters['id']!;
          return _buildPageWithAnimation(
            context,
            state,
            LogicalFrameworkScreen(concernId: concernId),
          );
        },
      ),

      // 비교 항목 설정
      GoRoute(
        path: '/concern/:id/comparison-setup',
        name: 'comparison-setup',
        pageBuilder: (context, state) {
          final concernId = state.pathParameters['id']!;
          return _buildPageWithAnimation(
            context,
            state,
            ComparisonSetupScreen(concernId: concernId),
          );
        },
      ),

      // 점수 매기기
      GoRoute(
        path: '/concern/:id/scoring',
        name: 'scoring',
        pageBuilder: (context, state) {
          final concernId = state.pathParameters['id']!;
          return _buildPageWithAnimation(
            context,
            state,
            ScoringScreen(concernId: concernId),
          );
        },
      ),

      // 결과 화면
      GoRoute(
        path: '/concern/:id/result',
        name: 'result',
        pageBuilder: (context, state) {
          final concernId = state.pathParameters['id']!;
          return _buildPageWithAnimation(
            context,
            state,
            ResultScreen(concernId: concernId),
          );
        },
      ),

      // 타로 카드
      GoRoute(
        path: '/concern/:id/tarot',
        name: 'tarot',
        pageBuilder: (context, state) {
          final concernId = state.pathParameters['id']!;
          return _buildPageWithAnimation(
            context,
            state,
            TarotScreen(concernId: concernId),
          );
        },
      ),

      // 타로 카드 선택
      GoRoute(
        path: '/concern/:id/tarot/selection',
        name: 'tarot-selection',
        pageBuilder: (context, state) {
          final concernId = state.pathParameters['id']!;
          final extra = state.extra as Map<String, dynamic>?;
          final choiceName = extra?['choiceName'] ?? '';
          final choiceIndex = extra?['choiceIndex'] ?? 0;
          return _buildPageWithAnimation(
            context,
            state,
            TarotCardSelectionScreen(
              concernId: concernId,
              choiceName: choiceName,
              choiceIndex: choiceIndex,
            ),
          );
        },
      ),
    ],
  );

  /// 페이지 전환 애니메이션
  static Page<dynamic> _buildPageWithAnimation(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        var offsetAnimation = animation.drive(tween);
        var fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(parent: animation, curve: curve));

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(opacity: fadeAnimation, child: child),
        );
      },
    );
  }
}
