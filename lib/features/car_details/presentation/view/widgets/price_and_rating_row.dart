import 'package:car_zone/features/car_details/presentation/view/widgets/price_badge.dart';
import 'package:car_zone/features/car_details/presentation/view/widgets/rating_badge.dart';
import 'package:flutter/material.dart';

class PriceAndRatingRow extends StatelessWidget {
  final String price;

  const PriceAndRatingRow({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PriceBadge(price: price),
        const Spacer(),
        const RatingBadge(),
      ],
    );
  }
}
