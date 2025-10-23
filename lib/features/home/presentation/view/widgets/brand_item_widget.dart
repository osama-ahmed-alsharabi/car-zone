import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/features/home/data/model/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BrandItemWidget extends StatelessWidget {
  final BrandModel brand;
  const BrandItemWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(16),
      width: 70,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      child: SvgPicture.asset(
        brand.image[brand.id - 1],
        colorFilter: const ColorFilter.mode(
          AppColors.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
