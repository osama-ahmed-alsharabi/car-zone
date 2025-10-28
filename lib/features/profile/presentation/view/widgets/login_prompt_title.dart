import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class LoginPromptTitle extends StatelessWidget {
  const LoginPromptTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "مرحباً بك!",
      style: context.textStyle.text24Bold.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
