import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/features/home/data/model/brand_model.dart';
import 'package:car_zone/features/home/presentation/view/widgets/brand_item_widget.dart';
import 'package:flutter/material.dart';

class BrandListViewWidget extends StatelessWidget {
  final List<BrandModel>? brands;
  const BrandListViewWidget({super.key, this.brands});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("البراندات العالمية", style: context.textStyle.text24Bold),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "عرض الكل",
                    style: context.textStyle.text16Regular.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: brands?.length ?? 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BrandItemWidget(
                  brand:
                      brands?[index] ??
                      BrandModel(
                        id: 1,
                        name: "",
                        isActive: 1,
                        deletedAt: null,
                        createdAt: null,
                        updatedAt: null,
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
