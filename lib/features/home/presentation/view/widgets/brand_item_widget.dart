import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/features/home/data/model/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BrandItemWidget extends StatelessWidget {
  final BrandModel brand;
  const BrandItemWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouterConst.brandCarslViewRouteName, extra: brand);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(16),
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: brand.name.isNotEmpty ? Colors.black : Colors.white10,
            ),
            child: brand.name.isNotEmpty
                ? SvgPicture.asset(
                    height: 50,
                    brand.image[brand.id - 1],
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  )
                : SizedBox(height: 50, width: 50),
          ),
          brand.name.isNotEmpty
              ? Text(brand.name, style: context.textStyle.text16Regular)
              : Text("brand", style: context.textStyle.text16Regular),
        ],
      ),
    );
  }
}
