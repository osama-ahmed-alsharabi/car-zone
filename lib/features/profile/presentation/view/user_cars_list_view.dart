import 'package:car_zone/core/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class UserCarsListView extends StatelessWidget {
  const UserCarsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(context: context, titleText: "معرض سياراتي"),
    );
  }
}
