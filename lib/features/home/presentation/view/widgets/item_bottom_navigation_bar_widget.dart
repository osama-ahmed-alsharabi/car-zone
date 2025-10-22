import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ItemBottomNavigationBarWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? onTap;
  final bool isShow;
  const ItemBottomNavigationBarWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    required this.isShow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isShow ? AppColors.primaryColor : null,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 5),
            Icon(icon),
            SizedBox(width: 5),
            isShow
                ? Text(title, style: context.textStyle.text14Regular)
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
