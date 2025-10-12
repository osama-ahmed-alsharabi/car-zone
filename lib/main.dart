import 'package:car_zone/core/theme/dark_theme.dart';
import 'package:car_zone/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CarZone());
}

class CarZone extends StatelessWidget {
  const CarZone({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: dark(),
      debugShowCheckedModeBanner: false,
      home: SplashView());
  }
}
