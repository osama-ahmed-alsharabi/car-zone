import 'package:car_zone/core/widgets/custom_button_widget.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/profile_header.dart';
import 'package:car_zone/features/profile/presentation/view/widgets/setting_setion.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _ProfileBackground(),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
            top: 16,
            bottom: 100,
          ),
          child: Column(
            children: const [
              SizedBox(height: 70),
              ProfileHeader(),
              SizedBox(height: 40),
              SettingsSection(),
              SizedBox(height: 40),
              CustomButtonWidget(text: "تسجيل الخروج"),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileBackground extends StatelessWidget {
  const _ProfileBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF1A1A1A), Color(0xFF0E0E0E)],
        ),
      ),
    );
  }
}
