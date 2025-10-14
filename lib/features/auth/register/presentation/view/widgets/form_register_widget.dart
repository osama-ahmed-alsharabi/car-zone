import 'package:car_zone/core/widgets/custom_button_widget.dart';
import 'package:car_zone/core/widgets/custom_text_from_field_widget.dart';
import 'package:car_zone/features/auth/register/data/model/user_model.dart';
import 'package:car_zone/features/auth/register/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormRegisterWidget extends StatefulWidget {
  const FormRegisterWidget({super.key});

  @override
  State<FormRegisterWidget> createState() => _FormRegisterWidgetState();
}

class _FormRegisterWidgetState extends State<FormRegisterWidget> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
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
          CustomTextFormFieldWidget(
            controller: fullNameController,
            labelText: 'الاسم الكامل',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 15),
          CustomTextFormFieldWidget(
            controller: emailController,
            labelText: 'البريد الإلكتروني',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 15),
          CustomTextFormFieldWidget(
            controller: passwordController,
            labelText: "كلمة المرور",
            icon: Icons.lock_outline,
          ),
          const SizedBox(height: 30),
          CustomButtonWidget(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                await BlocProvider.of<RegisterCubit>(context).registerCubit(
                  user: UserModel(
                    fullName: fullNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            text: 'إنشاء حساب',
          ),
        ],
      ),
    );
  }
}
