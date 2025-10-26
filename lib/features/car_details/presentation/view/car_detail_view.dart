import 'package:car_zone/features/car_details/presentation/view/widgets/car_action_buttons.dart';
import 'package:car_zone/features/car_details/presentation/view/widgets/car_details_body.dart';
import 'package:car_zone/features/car_details/presentation/view/widgets/car_image_header.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:flutter/material.dart';

class CarDetailView extends StatelessWidget {
  final CarModel car;

  const CarDetailView({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CarImageHeader(car: car),
          CarDetailsBody(car: car),
        ],
      ),
      bottomNavigationBar: CarActionButtons(car: car),
    );
  }
}
