import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

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
        Text("أسامة الشرعبي", style: context.textStyle.text28Bold),
        const SizedBox(height: 8),
        Text(
          "osama@email.com",
          style: context.textStyle.text16Bold.copyWith(
            color: Colors.white.withAlpha(200),
          ),
        ),
      ],
    );
  }
}
