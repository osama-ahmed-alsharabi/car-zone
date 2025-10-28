import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_state.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/login_prompt_section.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/profile_loading_section.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/user_profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserViewModelCubit, UserViewModelState>(
      builder: (context, state) {
        if (state is UserViewModelHasData) {
          return UserProfileSection(userState: state);
        } else if (state is UserViewModelNoData) {
          return const LoginPromptSection();
        } else {
          return const ProfileLoadingSection();
        }
      },
    );
  }
}
