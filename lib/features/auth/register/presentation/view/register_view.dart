import 'package:car_zone/core/widgets/custom_app_bar_widget.dart';
import 'package:car_zone/features/auth/register/presentation/view/widgets/body_register_widget.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        context: context,
        titleText: 'إنشاء حساب جديد',
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: BodyRegisterWidget(),
        ),
      ),
    );
  }
}
