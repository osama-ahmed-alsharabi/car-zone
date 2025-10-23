
import 'package:flutter/material.dart';

class HomeCarListViewWidget extends StatelessWidget {
  const HomeCarListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }
}
