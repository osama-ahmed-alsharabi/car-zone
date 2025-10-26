import 'package:flutter/material.dart';

class RatingBadge extends StatelessWidget {
  const RatingBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.amber[600],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withAlpha(80),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Row(
        children: [
          Text(
            "4.4",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'Cairo',
            ),
          ),
          SizedBox(width: 6),
          Icon(Icons.star, color: Colors.white, size: 18),
        ],
      ),
    );
  }
}
