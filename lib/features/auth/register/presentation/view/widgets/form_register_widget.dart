import 'package:car_zone/core/helpers/validator_helper.dart';
import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/widgets/custom_button_widget.dart';
import 'package:car_zone/core/widgets/custom_snack_bar.dart';
import 'package:car_zone/core/widgets/custom_text_from_field_password_widget.dart';
import 'package:car_zone/core/widgets/custom_text_from_field_widget.dart';
import 'package:car_zone/core/model/user_model.dart';
import 'package:car_zone/features/auth/register/presentation/view/widgets/accept_privacy_and_terms_widget.dart';
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
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirempasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isAccept = false;

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirempasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormFieldWidget(
            validator: (value) => ValidatorHelper.validateRequired(
              value,
              fieldName: 'الاسم الكامل',
              context: context,
            ),
            controller: fullNameController,
            labelText: 'الاسم الكامل',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 15),
          CustomTextFormFieldWidget(
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                ValidatorHelper.validateEmail(value, context: context),
            controller: emailController,
            labelText: 'البريد الإلكتروني',
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 15),
          CustomTextFormFieldWidget(
            validator: (value) =>
                ValidatorHelper.validatePhoneNumber(value, context: context),
            keyboardType: TextInputType.number,
            controller: phoneController,
            labelText: 'رقم الهاتف',
            icon: Icons.phone,
          ),
          const SizedBox(height: 15),
          CustomTextFormFieldPasswordWidget(
            validator: (value) =>
                ValidatorHelper.validatePassword(value, context: context),
            controller: passwordController,
            labelText: "كلمة المرور",
            icon: Icons.lock_outline,
          ),
          const SizedBox(height: 15),
          CustomTextFormFieldPasswordWidget(
            validator: (value) =>
                ValidatorHelper.validatePassword(value, context: context),
            controller: confirempasswordController,
            labelText: "تأكيد كلمة المرور",
            icon: Icons.lock_outline,
          ),
          const SizedBox(height: 15),
          AcceptPrivacyAndTermsWidget(
            isAccept: isAccept,
            onChanged: (value) {
              isAccept = !isAccept;
              setState(() {});
            },
          ),
          const SizedBox(height: 30),
          CustomButtonWidget(
            onPressed: () async {
              await registerUser(context);
            },
            text: 'إنشاء حساب',
          ),
        ],
      ),
    );
  }

  Future<void> registerUser(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (passwordController.text == confirempasswordController.text) {
        if (isAccept) {
          await BlocProvider.of<RegisterCubit>(context).registerWithAPI(
            user: UserModel(
              fullName: fullNameController.text,
              email: emailController.text,
              password: passwordController.text,
              phoneNumber: phoneController.text,
            ),
          );
        } else {
          CustomSnackBar.customSnackBar(
            context: context,
            title: "الرجاء قراءة الشروط والأحكام و سياسة الخصوصية ",
            color: AppColors.errorColor,
          );
        }
      } else {
        CustomSnackBar.customSnackBar(
          context: context,
          title: "كلمة السر غير متطابقة",
          color: AppColors.errorColor,
        );
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
