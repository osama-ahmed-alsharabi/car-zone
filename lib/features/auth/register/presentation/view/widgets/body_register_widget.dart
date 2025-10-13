
import 'package:car_zone/features/auth/login/presentation/view/widgets/login_by_google_account_widget.dart';
import 'package:car_zone/features/auth/login/presentation/view/widgets/or_divider_widget.dart';
import 'package:car_zone/features/auth/register/presentation/view/widgets/form_register_widget.dart';
import 'package:car_zone/features/auth/register/presentation/view/widgets/you_aleardy_have_an_account_widget.dart';
import 'package:flutter/material.dart';

class BodyRegisterWidget extends StatelessWidget {
  const BodyRegisterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FormRegisterWidget(),
        const SizedBox(height: 25),
        OrDividerWidget(),
        const SizedBox(height: 25),
        LoginByGoogleAccountWidget(label: 'إنشاء حساب بواسطة Google'),
        const SizedBox(height: 40),
        YouAlreadyHaveAnAccountWidget(),
      ],
    );
  }
}
