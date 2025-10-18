import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_router_const.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class YouDoNotHaveAnAccountWidget extends StatelessWidget {
  const YouDoNotHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('ليس لديك حساب؟ ', style: TextStyle(color: Colors.white70)),
        TextButton(
          onPressed: () {
            context.pushNamed(AppRouterConst.registerViewRouteName);
          },
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
