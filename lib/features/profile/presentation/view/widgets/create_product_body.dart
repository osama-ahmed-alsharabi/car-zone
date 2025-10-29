import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/core/widgets/custom_text_from_field_widget.dart';
import 'package:flutter/material.dart';

class CreateProductBody extends StatelessWidget {
  const CreateProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Text(
            "ابدأ البيع بخطوة بسيطة… والباقي علينا!",
            style: context.textStyle.text18SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 30),
          CustomTextFormFieldWidget(
            labelText: "اسم السيارة",
            icon: Icons.title,
          ),
          SizedBox(height: 20),
          CustomTextFormFieldWidget(
            maxLines: 5,
            labelText: "وصف السيارة",
            icon: Icons.description,
          ),
        ],
      ),
    );
  }
}
