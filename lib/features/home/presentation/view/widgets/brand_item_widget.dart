import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BrandItemWidget extends StatelessWidget {
  const BrandItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(16),
      width: 70,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      child: SvgPicture.asset(
        AppAssets.imagesHondaLogo,
        color: AppColors.primaryColor,
      ),
    );
  }
}
