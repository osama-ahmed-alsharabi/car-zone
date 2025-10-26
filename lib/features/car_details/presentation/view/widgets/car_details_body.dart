import 'package:car_zone/features/car_details/presentation/view/widgets/description_section.dart';
import 'package:car_zone/features/car_details/presentation/view/widgets/location_section.dart';
import 'package:car_zone/features/car_details/presentation/view/widgets/price_and_rating_row.dart';
import 'package:car_zone/features/car_details/presentation/view/widgets/seller_info_section.dart';
import 'package:car_zone/features/car_details/presentation/view/widgets/specification_section.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:flutter/material.dart';

class CarDetailsBody extends StatelessWidget {
  final CarModel car;

  const CarDetailsBody({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PriceAndRatingRow(price: car.price),
            const SizedBox(height: 24),
            DescriptionSection(description: car.description),
            const SizedBox(height: 28),
            SpecificationsSection(car: car),
            const SizedBox(height: 28),
            if (car.latitude != null && car.longitude != null) ...[
              LocationSection(car: car),
              const SizedBox(height: 28),
            ],
            SellerInfoSection(userId: car.userId,),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
