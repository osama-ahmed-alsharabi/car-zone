import 'package:car_zone/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoginPromptIcon extends StatelessWidget {
  const LoginPromptIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withAlpha(210),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withAlpha(150),
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ],
      ),
      child: const Icon(
        Icons.person_outline_rounded,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}
