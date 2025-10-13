import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends AppBar {
  CustomAppBarWidget({
    super.key,
    required BuildContext context,
    required String titleText,
  }) : super(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor.withAlpha(80),
                  foregroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                const SizedBox(width: 25),
                Text(
                  titleText,
                  style: context.textStyle.text28Bold,
                ),
              ],
            ),
          ),
          toolbarHeight: 70,
          flexibleSpace: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: SizedBox.shrink(),
          ),
        );
}
