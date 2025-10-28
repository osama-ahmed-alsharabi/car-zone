import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPrompt extends StatelessWidget {
  const RegisterPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ليس لديك حساب؟",
          style: context.textStyle.text14Bold.copyWith(color: Colors.white54),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            _handleRegister(context);
          },
          child: Text(
            "إنشاء حساب",
            style: context.textStyle.text14Bold.copyWith(
              color: AppColors.primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  void _handleRegister(BuildContext context) {
    context.pushNamed(AppRouterConst.registerViewRouteName);
  }
}
