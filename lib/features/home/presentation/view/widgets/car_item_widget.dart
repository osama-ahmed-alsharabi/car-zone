import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/core/utils/assets.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarItemWidget extends StatelessWidget {
  final CarModel car;
  const CarItemWidget({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/${AppRouterConst.carDetailViewRouteName}", extra: car);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 140,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Hero(
                tag: 'car-${car.id}',
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: car.images.mainImage.isNotEmpty
                          ? NetworkImage(car.images.mainImage )
                          : AssetImage(AppAssets.imagesSecondImageOnboarding),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            car.title,
                            style: context.textStyle.text16Bold,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "4.4",
                                style: context.textStyle.text12Regular,
                              ),
                              const SizedBox(width: 2),
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      car.description,
                      maxLines: 2,
                      style: context.textStyle.text14Regular.copyWith(
                        color: Colors.grey[600],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${car.price}",
                          style: context.textStyle.text16Bold.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            car.condition,
                            style: context.textStyle.text12Regular.copyWith(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
