import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CallButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CallButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.phone, size: 22),
      label: Text('اتصال', style: context.textStyle.text28Bold),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.successColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        shadowColor: Colors.green.withAlpha(150),
      ),
      onPressed: onPressed,
    );
  }
}
