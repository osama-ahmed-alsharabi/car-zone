import 'package:car_zone/core/utils/assets.dart';
import 'package:car_zone/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with TickerProviderStateMixin {
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

    _moveRightAnimation = Tween<double>(begin: 0, end: 500).animate(
      CurvedAnimation(parent: _moveRightController, curve: Curves.easeIn),
    );

    _startAnimationSequence();
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardingView()),
        );
      }
    });
  }

  Future<void> _startAnimationSequence() async {
    await _moveUpController.forward(); 
    await Future.delayed(const Duration(seconds: 1)); 
    await _moveRightController.forward(); 
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
            animation: Listenable.merge([_moveUpController, _moveRightController]),
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(_moveRightAnimation.value, _moveUpAnimation.value),
                child: child,
              );
            },
            child: Image.asset(
              AppAssets.imagesLogo,
            ),
          ),
        ),
      ),
    );
  }
}
