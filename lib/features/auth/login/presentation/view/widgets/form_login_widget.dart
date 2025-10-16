import 'package:car_zone/core/helpers/validator_helper.dart';
import 'package:car_zone/core/model/user_model.dart';
import 'package:car_zone/core/widgets/custom_button_widget.dart';
import 'package:car_zone/core/widgets/custom_text_from_field_password_widget.dart';
import 'package:car_zone/core/widgets/custom_text_from_field_widget.dart';
import 'package:car_zone/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormLoginWidget extends StatefulWidget {
  const FormLoginWidget({super.key});

  @override
  State<FormLoginWidget> createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 40),
          CustomTextFormFieldWidget(
            validator: (value) =>
                ValidatorHelper.validateEmail(value, context: context),
            controller: emailController,
            labelText: 'البريد الإلكتروني',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 20),
          CustomTextFormFieldPasswordWidget(
            validator: (value) =>
                ValidatorHelper.validatePassword(value, context: context),
            controller: passwordController,
            labelText: "كلمة المرور",
            icon: Icons.lock_outline,
          ),
          const SizedBox(height: 30),
          CustomButtonWidget(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<LoginCubit>(
                  context,
                ).loginWithEmailAndPasswordCubit(
                  user: UserModel(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            text: 'تسجيل الدخول',
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
