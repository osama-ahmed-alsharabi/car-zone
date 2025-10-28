import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class LoginPromptDescription extends StatelessWidget {
  const LoginPromptDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "سجل الدخول لتتمتع بتجربة كاملة ومخصصة\nوحفظ إعداداتك وتفضيلاتك",
      style: context.textStyle.text16Bold.copyWith(
        color: Colors.white70,
        height: 1.5,
      ),
      textAlign: TextAlign.center,
    );
  }
}
