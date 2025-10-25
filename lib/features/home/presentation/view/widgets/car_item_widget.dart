import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/core/utils/assets.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:flutter/material.dart';

class CarItemWidget extends StatelessWidget {
  final CarModel car;
  const CarItemWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AppAssets.imagesSecondImageOnboarding),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      car.title,
                      style: context.textStyle.text16Bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Text("4.4"),
                          Icon(Icons.star, color: Colors.amberAccent),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Text(
                    car.description,
                    maxLines: 2,
                    style: context.textStyle.text16Regular,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "\$${car.price}",
                  style: context.textStyle.text16Bold.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
