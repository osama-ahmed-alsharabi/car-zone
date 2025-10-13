import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class LoginAsAVisiterWidget extends StatelessWidget {
  const LoginAsAVisiterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text("الدخول كزائر", style: context.textStyle.text16Regular),
    );
  }
}
