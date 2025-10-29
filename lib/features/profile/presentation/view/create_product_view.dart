import 'package:car_zone/core/widgets/custom_app_bar_widget.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/create_product_body.dart';
import 'package:flutter/material.dart';

class CreateProductView extends StatelessWidget {
  const CreateProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        context: context,
        titleText: "اضافة سيارة للبيع",
      ),
      body: CreateProductBody(),
    );
  }
}