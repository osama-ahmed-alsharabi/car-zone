import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SpecificationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const SpecificationItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withAlpha(80),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primaryColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.textStyle.text14Regular),
                const SizedBox(height: 6),
                Text(value, style: context.textStyle.text16Regular),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
