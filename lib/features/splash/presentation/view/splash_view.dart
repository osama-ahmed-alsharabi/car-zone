import 'package:car_zone/core/helpers/service_locator.dart';
import 'package:car_zone/core/helpers/shared_pref_helper.dart';
import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _moveUpController;
  late AnimationController _moveRightController;

  late Animation<double> _moveUpAnimation;
  late Animation<double> _moveRightAnimation;

  @override
  void initState() {
    super.initState();

    _moveUpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _moveUpAnimation = Tween<double>(begin: 150, end: 0).animate(
      CurvedAnimation(parent: _moveUpController, curve: Curves.easeOutCubic),
    );

    _moveRightController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _moveRightAnimation = Tween<double>(begin: 0, end: 450).animate(
      CurvedAnimation(parent: _moveRightController, curve: Curves.easeIn),
    );

    _startAnimationSequence();
  }

  Future<void> _startAnimationSequence() async {
    final isFirstTime = getIt.get<SharedPrefHelper>().isFirstTime();
    await _moveUpController.forward();
    await Future.delayed(const Duration(seconds: 1));
    await _moveRightController.forward();
    if (mounted) {
      context.go(
        isFirstTime
            ? "/${AppRouterConst.onBoardingViewRouteName}"
            : "/${AppRouterConst.loginViewRouteName}",
      );
    }
  }

  @override
  void dispose() {
    _moveUpController.dispose();
    _moveRightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: Listenable.merge([
              _moveUpController,
              _moveRightController,
            ]),
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  _moveRightAnimation.value,
                  _moveUpAnimation.value,
                ),
                child: child,
              );
            },
            child: Image.asset(AppAssets.imagesLogo),
          ),
        ),
      ),
    );
  }
}
