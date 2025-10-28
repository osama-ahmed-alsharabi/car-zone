import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/widgets/custom_snack_bar.dart';
import 'package:car_zone/core/widgets/loading_widget.dart';
import 'package:car_zone/features/auth/login/presentation/view/widgets/body_login_widget.dart';
import 'package:car_zone/features/auth/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:car_zone/features/auth/login/presentation/view_model/cubit/login_state.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginConsumerBuilderWidget extends StatelessWidget {
  const LoginConsumerBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          await BlocProvider.of<UserViewModelCubit>(context).getUserData();
          if (!context.mounted) return;
          CustomSnackBar.customSnackBar(
            context: context,
            title: state.successMessage,
            color: AppColors.successColor,
          );
          context.go("/${AppRouterConst.homeViewRouteName}");
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
            child: const Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
