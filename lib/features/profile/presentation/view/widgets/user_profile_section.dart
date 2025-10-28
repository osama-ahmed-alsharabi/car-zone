import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/features/home/presentation/view_model/user_view_model.dart/user_view_model_state.dart';
import 'package:flutter/material.dart';

class UserProfileSection extends StatelessWidget {
  final UserViewModelHasData userState;

  const UserProfileSection({super.key, required this.userState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x55C3322B),
                blurRadius: 25,
                spreadRadius: 3,
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 55,
            child: Icon(Icons.person, size: 85),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          userState.user.fullName ?? "لا يوجد اسم",
          style: context.textStyle.text28Bold,
        ),
        const SizedBox(height: 8),
        Text(
          userState.user.email,
          style: context.textStyle.text16Bold.copyWith(
            color: Colors.white.withAlpha(200),
          ),
        ),
      ],
    );
  }
}
