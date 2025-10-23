import 'package:car_zone/features/home/presentation/view/widgets/home_bloc_builder_widget.dart';
import 'package:car_zone/features/home/presentation/view/widgets/home_bottom_navigation_bar_widget.dart';
import 'package:car_zone/features/home/presentation/view_model/home_ui/home_ui_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeUiCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            const HomeBlocBuilderWidget(),
            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: HomeBottomNavigationBarWidgetInline(),
            ),
          ],
        ),
      ),
    );
  }
}
