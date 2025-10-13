import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginByGoogleAccountWidget extends StatelessWidget {
  const LoginByGoogleAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton.icon(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        icon: SvgPicture.asset(AppAssets.imagesGoogleLogo),
        label: Text(
          'تسجيل الدخول بواسطة Google',
          style: context.textStyle.text16Regular.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
