import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212224),
      body: SafeArea(
        child: Center(
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}