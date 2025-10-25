import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:car_zone/features/home/presentation/view/widgets/car_item_widget.dart';
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
          return CarItemWidget(car: cars[index]);
        },
      ),
    );
  }
}
