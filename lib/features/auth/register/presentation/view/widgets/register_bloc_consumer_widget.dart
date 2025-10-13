import 'package:car_zone/core/widgets/custom_app_bar_widget.dart';
import 'package:car_zone/core/widgets/loading_widget.dart';
import 'package:car_zone/features/auth/register/presentation/view/widgets/body_register_widget.dart';
import 'package:car_zone/features/auth/register/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:car_zone/features/auth/register/presentation/view_model/register_cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocConsumerWidget extends StatelessWidget {
  const RegisterBlocConsumerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessful) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم تسجيل الدخول بنجاح")));
        } else if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: state is! RegisterLoading,
          child: LoadingWidget(
            isLoading: state is RegisterLoading,
            child: Scaffold(
              appBar: CustomAppBarWidget(
                context: context,
                titleText: 'إنشاء حساب جديد',
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: BodyRegisterWidget(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
