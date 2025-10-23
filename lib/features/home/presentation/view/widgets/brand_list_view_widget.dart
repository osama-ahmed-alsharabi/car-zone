import 'package:car_zone/features/home/presentation/view/widgets/brand_item_widget.dart';
import 'package:flutter/material.dart';

class BrandListViewWidget extends StatelessWidget {
  const BrandListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return BrandItemWidget();
          },
        ),
      ),
    );
  }
}
