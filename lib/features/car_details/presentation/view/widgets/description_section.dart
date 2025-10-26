
import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  final String description;

  const DescriptionSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الوصف',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.6,
              fontFamily: 'Cairo',
              fontSize: 16,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
