import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/features/on_boarding/data/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingContentWidget extends StatelessWidget {
  final OnboardingModel page;

  const OnboardingContentWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withAlpha(80),
                    blurRadius: 30,
                    spreadRadius: 5,
                    offset: Offset(0, 10),
                  ),
                  BoxShadow(
                    color: Colors.black.withAlpha(60),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  page.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            page.title,
            style: context.textStyle.text24Bold.copyWith(
              color: Colors.white,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              page.description,
              style: context.textStyle.text16Regular.copyWith(
                color: Colors.grey[400],
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
