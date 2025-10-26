import 'package:flutter/material.dart';

class CallButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CallButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.phone, size: 22),
      label: const Text(
        'اتصال',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          fontFamily: 'Cairo',
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        shadowColor: Colors.green.withAlpha(150),
      ),
      onPressed: onPressed,
    );
  }
}
