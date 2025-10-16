import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/widgets/custom_snack_bar.dart';
import 'package:car_zone/core/widgets/loading_widget.dart';
import 'package:car_zone/features/auth/login/presentation/view/widgets/body_login_widget.dart';
import 'package:car_zone/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:car_zone/features/auth/login/presentation/view_model/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginConsumerBuilderWidget extends StatelessWidget {
  const LoginConsumerBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          CustomSnackBar.customSnackBar(
            context: context,
            title: "تم تسجيل الدخول بنجاح",
            color: AppColors.successColor,
          );
        } else if (state is LoginFaulier) {
          CustomSnackBar.customSnackBar(
            context: context,
            title: state.errorMessage,
            color: AppColors.errorColor,
          );
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: state is! LoginLoading,
          child: LoadingWidget(
            isLoading: state is LoginLoading,
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: BodyLoginWidget(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
