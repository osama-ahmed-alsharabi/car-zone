import 'package:car_zone/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class YouDoNotHaveAnAccountWidget extends StatelessWidget {
  const YouDoNotHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('ليس لديك حساب؟ ', style: TextStyle(color: Colors.white70)),
        TextButton(
          onPressed: () {},
          child: Text(
            'إنشاء حساب',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
