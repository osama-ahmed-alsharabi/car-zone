import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/core/utils/assets.dart';
import 'package:car_zone/features/auth/login/presentation/view/widgets/form_login_widget.dart';
import 'package:car_zone/features/auth/login/presentation/view/widgets/login_as_a_visiter_widget.dart';
import 'package:car_zone/features/auth/login/presentation/view/widgets/login_by_google_account_widget.dart';
import 'package:car_zone/features/auth/login/presentation/view/widgets/or_divider_widget.dart';
import 'package:car_zone/features/auth/login/presentation/view/widgets/you_do_not_have_an_account_widget.dart';
import 'package:flutter/material.dart';

class BodyLoginWidget extends StatelessWidget {
  const BodyLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppAssets.imagesLogo),
        Text('تسجيل الدخول', style: context.textStyle.text28Bold),
        const FormLoginWidget(),
        const OrDividerWidget(),
        const SizedBox(height: 25),
        const LoginAsAVisiterWidget(),
        const SizedBox(height: 20),
        const LoginByGoogleAccountWidget(),
        const SizedBox(height: 30),
        const YouDoNotHaveAnAccountWidget(),
      ],
    );
  }
}
