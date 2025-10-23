import 'package:car_zone/features/home/presentation/view/widgets/brand_section_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/home_app_bar_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/search_app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBodyWidget extends StatelessWidget {
  const HomeViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBarWidget(context: context),
        SearchBarAppWidget(),
        BrandSectionWidget(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(16),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
