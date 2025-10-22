import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeAppBarWidget extends AppBar {
  HomeAppBarWidget({super.key, required BuildContext context})
    : super(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("مبرحبا بك👋🏻", style: context.textStyle.text24Bold),
                  SizedBox(height: 13),
                  Text("أسامة", style: context.textStyle.text16Bold),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: AppColors.primaryColor.withAlpha(80),
                foregroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
              ),
            ],
          ),
        ),
        scrolledUnderElevation: 0,
        toolbarHeight: 70,
        flexibleSpace: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: SizedBox.shrink(),
        ),
      );
}
