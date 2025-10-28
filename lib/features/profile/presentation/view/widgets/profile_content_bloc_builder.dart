import 'package:car_zone/core/widgets/custom_button_widget.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_state.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/setting_setion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileContentBlocBuilder extends StatelessWidget {
  const ProfileContentBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserViewModelCubit, UserViewModelState>(
      builder: (context, state) {
        return state is UserViewModelHasData
            ? Column(
                children: [
                  SettingsSection(),
                  SizedBox(height: 40),
                  CustomButtonWidget(text: "تسجيل الخروج"),
                ],
              )
            : SizedBox();
      },
    );
  }
}
