import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withAlpha(225),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withAlpha(80),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            _handleLogin(context);
          },
          child: const LoginButtonContent(),
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    context.pushNamed(AppRouterConst.loginViewRouteName);
  }
}

class LoginButtonContent extends StatelessWidget {
  const LoginButtonContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.login_rounded, color: Colors.white, size: 20),
        const SizedBox(width: 8),
        Text(
          "تسجيل الدخول",
          style: context.textStyle.text16Bold.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
