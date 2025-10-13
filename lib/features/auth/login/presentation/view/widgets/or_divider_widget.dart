import 'package:flutter/material.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider(color: Colors.white24, thickness: 1.5)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('أو', style: TextStyle(color: Colors.white70)),
        ),
        Expanded(child: Divider(color: Colors.white24, thickness: 1.5)),
      ],
    );
  }
}
