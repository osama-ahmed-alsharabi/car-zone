import 'package:car_zone/features/home/presentation/view/widgets/custom_scroll_view_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/home_app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBodyWidget extends StatelessWidget {
  const HomeViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBarWidget(context: context),
        CustomScrollViewWidget(),
      ],
    );
  }
}
