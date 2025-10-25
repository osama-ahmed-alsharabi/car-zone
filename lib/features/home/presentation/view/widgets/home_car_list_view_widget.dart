import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:flutter/material.dart';

class HomeCarListViewWidget extends StatelessWidget {
  final List<CarModel> cars;
  const HomeCarListViewWidget({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsetsGeometry.only(bottom: 80),
      sliver: SliverList.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 130,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(child: Text(cars[index].title)),
          );
        },
      ),
    );
  }
}
