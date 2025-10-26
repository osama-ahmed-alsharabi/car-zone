import 'package:car_zone/core/widgets/custom_snack_bar.dart';
import 'package:car_zone/features/car_details/presentation/view/widgets/call_button.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:flutter/material.dart';

class CarActionButtons extends StatelessWidget {
  final CarModel car;

  const CarActionButtons({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          Expanded(child: CallButton(onPressed: () => _callSeller(context))),
        ],
      ),
    );
  }

  void _callSeller(BuildContext context) {
    CustomSnackBar.customSnackBar(
      context: context,
      title: 'جاري الاتصال بالبائع...',
    );
  }
}
