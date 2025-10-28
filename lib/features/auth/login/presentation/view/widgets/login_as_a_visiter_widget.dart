import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginAsAVisiterWidget extends StatelessWidget {
  const LoginAsAVisiterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await BlocProvider.of<UserViewModelCubit>(context).getUserData();
        if (!context.mounted) return;
        context.go("/${AppRouterConst.homeViewRouteName}");
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text("الدخول كزائر", style: context.textStyle.text16Regular),
      ),
    );
  }
}
