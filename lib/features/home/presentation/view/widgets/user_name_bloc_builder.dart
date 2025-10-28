import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserNameBlocBuilder extends StatelessWidget {
  const UserNameBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserViewModelCubit, UserViewModelState>(
      builder: (context, state) {
        if (state is UserViewModelHasData) {
          return Column(
            children: [
              SizedBox(height: 10),
              Text(
                state.user.fullName ?? "لا يوجد اسم",
                style: context.textStyle.text16Bold,
              ),
            ],
          );
        } else if (state is UserViewModelNoData) {
          return TextButton(
            onPressed: () {
              context.pushNamed(AppRouterConst.loginViewRouteName);
            },
            child: Text(
              "اضغط هنا لتسجيل الدخول",
              style: context.textStyle.text16Bold,
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
