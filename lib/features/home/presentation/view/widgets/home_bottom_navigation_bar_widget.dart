import 'package:car_zone/features/home/presentation/view/widgets/item_bottom_navigation_bar_widget.dart';
import 'package:car_zone/features/home/presentation/view_model/home_ui/home_ui_cubit.dart';
import 'package:car_zone/features/home/presentation/view_model/home_ui/home_ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBottomNavigationBarWidget extends StatelessWidget {
  const HomeBottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeUiCubit, HomeUiState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.all(24),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemBottomNavigationBarWidget(
                isShow: state is HomeUiHome || state is HomeUiInitial,
                onTap: () => BlocProvider.of<HomeUiCubit>(
                  context,
                ).changeHomeUi(pageNumber: 1),
                icon: Icons.home,
                title: "الرئيسية",
              ),
              ItemBottomNavigationBarWidget(
                isShow: state is HomeUiFavorite,
                onTap: () => BlocProvider.of<HomeUiCubit>(
                  context,
                ).changeHomeUi(pageNumber: 2),
                icon: Icons.favorite,
                title: "المفضلة",
              ),
              ItemBottomNavigationBarWidget(
                isShow: state is HomeUiPerson,
                onTap: () => BlocProvider.of<HomeUiCubit>(
                  context,
                ).changeHomeUi(pageNumber: 3),
                icon: Icons.person,
                title: "الحساب",
              ),
            ],
          ),
        );
      },
    );
  }
}
