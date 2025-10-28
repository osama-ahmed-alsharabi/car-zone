import 'package:car_zone/core/helpers/service_locator.dart';
import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/router/page_transitions.dart';
import 'package:car_zone/features/auth/login/presentation/view/login_view.dart';
import 'package:car_zone/features/auth/register/presentation/view/register_view.dart';
import 'package:car_zone/features/car_details/presentation/view/car_detail_view.dart';
import 'package:car_zone/features/home/data/model/brand_model.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:car_zone/features/home/data/repo/home_repo.dart';
import 'package:car_zone/features/home/presentation/view/brand_cars_view.dart';
import 'package:car_zone/features/home/presentation/view/home_view.dart';
import 'package:car_zone/features/home/presentation/view_model/get_data/get_data_cubit.dart';
import 'package:car_zone/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:car_zone/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          transitionsBuilder: PageTransitions.slideFromLeft,
        ),
      ),
      GoRoute(
        path: '/${AppRouterConst.carDetailViewRouteName}',
        name: AppRouterConst.carDetailViewRouteName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: CarDetailView(car: state.extra as CarModel),
          transitionsBuilder: PageTransitions.slideFromLeft,
        ),
      ),
      GoRoute(
        path: '/${AppRouterConst.homeViewRouteName}',
        name: AppRouterConst.homeViewRouteName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeView(),
          transitionsBuilder: PageTransitions.slideFromLeft,
        ),
      ),
      GoRoute(
        path: '/${AppRouterConst.brandCarslViewRouteName}',
        name: AppRouterConst.brandCarslViewRouteName,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) =>
                GetDataCubit(getIt.get<HomeRepo>())..getGetData(),
            child: BrandCarsView(brand: state.extra as BrandModel),
          ),
          transitionsBuilder: PageTransitions.slideFromLeft,
        ),
      ),
    ],
  );
}
