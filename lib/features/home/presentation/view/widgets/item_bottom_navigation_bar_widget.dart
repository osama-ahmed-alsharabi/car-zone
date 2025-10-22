import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ItemBottomNavigationBarWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  const ItemBottomNavigationBarWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(icon),
            Text(title, style: context.textStyle.text14Regular),
          ],
        ),
      ),
    );
  }
}
