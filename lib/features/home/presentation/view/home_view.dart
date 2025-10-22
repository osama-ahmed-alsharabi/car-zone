import 'package:car_zone/features/home/presentation/view/widgets/home_app_bar_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/home_bottom_navigation_bar_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/home_view_body_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarWidget(context: context),
      body: SafeArea(child: HomeViewBodyWidget()),
      bottomNavigationBar: HomeBottomNavigationBarWidget(),
    );
  }
}
