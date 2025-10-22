import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AcceptPrivacyAndTermsWidget extends StatelessWidget {
  final bool isAccept;
  final void Function(bool?)? onChanged;
  const AcceptPrivacyAndTermsWidget({
    super.key,
    required this.isAccept,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(value: isAccept, onChanged: onChanged),
        Expanded(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                "الرجاء الموافقة على ",
                style: context.textStyle.text16Regular,
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "الشروط والأحكام",
                  style: context.textStyle.text16Regular.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(" و ", style: context.textStyle.text16Regular),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "سياسة الخصوصية",
                  style: context.textStyle.text16Regular.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
