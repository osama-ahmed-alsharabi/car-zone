import 'package:car_zone/core/utils/app_router_const.dart';
import 'package:car_zone/core/utils/page_transitions.dart';
import 'package:car_zone/features/auth/login/presentation/view/login_view.dart';
import 'package:car_zone/features/auth/register/presentation/view/register_view.dart';
import 'package:car_zone/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:car_zone/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRouterConst.splashViewRouteName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SplashView(),
          transitionsBuilder: PageTransitions.noTransition,
        ),
      ),
      GoRoute(
        path: '/${AppRouterConst.onBoardingViewRouteName}',
        name: AppRouterConst.onBoardingViewRouteName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnBoardingView(),
          transitionsBuilder: PageTransitions.fadeTransition,
        ),
      ),
      GoRoute(
        path: '/${AppRouterConst.loginViewRouteName}',
        name: AppRouterConst.loginViewRouteName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginView(),
          transitionsBuilder: PageTransitions.zoom,
        ),
      ),
      GoRoute(
        path: '/${AppRouterConst.registerViewRouteName}',
        name: AppRouterConst.registerViewRouteName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RegisterView(),
          transitionsBuilder: PageTransitions.slideFromBottom,
        ),
      ),
    ],
  );
}
