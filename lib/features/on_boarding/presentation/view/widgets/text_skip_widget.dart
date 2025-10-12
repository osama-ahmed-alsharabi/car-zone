import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class TextSkipWidget extends StatelessWidget {
  const TextSkipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "تخطي",
          style: context.textStyle.text16Bold.copyWith(
            color: Colors.grey[400],
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
