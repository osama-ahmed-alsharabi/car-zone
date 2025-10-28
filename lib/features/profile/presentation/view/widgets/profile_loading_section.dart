import 'package:flutter/material.dart';

class ProfileLoadingSection extends StatelessWidget {
  const ProfileLoadingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(150),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 55,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 85, color: Colors.white30),
          ),
        ),
        const SizedBox(height: 16),
        const LoadingShimmer(width: 150, height: 24),
        const SizedBox(height: 8),
        const LoadingShimmer(width: 200, height: 16),
      ],
    );
  }
}

class LoadingShimmer extends StatelessWidget {
  final double width;
  final double height;

  const LoadingShimmer({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
