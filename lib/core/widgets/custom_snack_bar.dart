import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

abstract class CustomSnackBar {
  static customSnackBar({
    required BuildContext context,
    Color? color,
    required String title,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(title, style: context.textStyle.text14Bold),
      ),
    );
  }
}
