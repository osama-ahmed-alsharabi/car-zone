import 'package:car_zone/core/widgets/custom_button_widget.dart';
import 'package:car_zone/core/widgets/custom_text_from_field_widget.dart';
import 'package:flutter/material.dart';

class FormRegisterWidget extends StatelessWidget {
  const FormRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormFieldWidget(
            labelText: 'الاسم الكامل',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 20),
          CustomTextFormFieldWidget(
            labelText: 'البريد الإلكتروني',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 20),
          CustomTextFormFieldWidget(
            labelText: "كلمة المرور",
            icon: Icons.lock_outline,
          ),
          const SizedBox(height: 30),
          CustomButtonWidget(text: 'إنشاء حساب'),
        ],
      ),
    );
  }
}
