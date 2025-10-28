import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/login_button_profile.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/login_prompt_description.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/login_prompt_icon.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/login_prompt_title.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/register_prompt.dart';
import 'package:flutter/material.dart';

class LoginPromptSection extends StatelessWidget {
  const LoginPromptSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor.withAlpha(50)),
      ),
      child: Column(
        children: [
          const LoginPromptIcon(),
          const SizedBox(height: 20),
          const LoginPromptTitle(),
          const SizedBox(height: 12),
          const LoginPromptDescription(),
          const SizedBox(height: 24),
          const LoginButton(),
          const SizedBox(height: 16),
          const RegisterPrompt(),
        ],
      ),
    );
  }
}
