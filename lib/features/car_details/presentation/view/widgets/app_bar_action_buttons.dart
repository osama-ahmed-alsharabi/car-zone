import 'package:car_zone/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarActionButtons extends StatelessWidget {
  const AppBarActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CircularIconButton(
          icon: Icons.share,
          onPressed: () => _shareCar(context),
        ),
        const SizedBox(width: 8),
        _CircularIconButton(
          icon: Icons.favorite_border,
          onPressed: () => _toggleFavorite(context),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  void _shareCar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('سيتم تفعيل خاصية المشاركة قريباً'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _toggleFavorite(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تمت إضافة السيارة إلى المفضلة'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class _CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _CircularIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.primaryColor.withAlpha(80),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20),
        onPressed: onPressed,
      ),
    );
  }
}
