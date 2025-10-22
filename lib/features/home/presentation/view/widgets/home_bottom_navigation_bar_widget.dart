import 'package:car_zone/features/home/presentation/view/widgets/item_bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigationBarWidget extends StatelessWidget {
  const HomeBottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          ItemBottomNavigationBarWidget(icon: Icons.home, title: "الرئيسية"),
          ItemBottomNavigationBarWidget(icon: Icons.favorite, title: "المفضلة"),
          ItemBottomNavigationBarWidget(icon: Icons.person, title: "الحساب"),
        ],
      ),
    );
  }
}
