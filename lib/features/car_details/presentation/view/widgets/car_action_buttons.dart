import 'package:car_zone/core/router/app_router_const.dart';
import 'package:car_zone/core/widgets/custom_dialog.dart';
import 'package:car_zone/core/widgets/custom_snack_bar.dart';
import 'package:car_zone/features/car_details/presentation/view/widgets/call_button.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CarActionButtons extends StatelessWidget {
  final CarModel car;

  const CarActionButtons({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        children: [
          Expanded(child: CallButton(onPressed: () => _callSeller(context))),
        ],
      ),
    );
  }

  void _callSeller(BuildContext context) {
    if (BlocProvider.of<UserViewModelCubit>(context).state
        is UserViewModelHasData) {
      CustomSnackBar.customSnackBar(
        context: context,
        title: 'جاري الاتصال بالبائع...',
      );
    } else {
      CustomDialog.showCustomDialog(
        context: context,
        title: "تسجيل الدخول مطلوب",
        message: "الرجاء تسجيل الدخول أولاً قبل التواصل مع البائع.",
        confirmText: "تسجيل الدخول",
        cancelText: "إلغاء",
        icon: Icons.warning_amber_rounded,
        onConfirm: () {
          context.goNamed(AppRouterConst.loginViewRouteName);
        },
      );
    }
  }
}
