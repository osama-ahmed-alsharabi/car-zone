import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/core/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';

class SellerInfoSection extends StatelessWidget {
  final int userId;
  const SellerInfoSection({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('معلومات البائع', style: context.textStyle.text24Bold),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[100]!),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            leading: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person_outline, color: Colors.white, size: 28),
            ),
            title: const Text(
              'مالك السيارة',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo',
                fontSize: 16,
              ),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.lightBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'تواصل',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
            onTap: () => _contactSeller(context),
          ),
        ),
      ],
    );
  }

  void _contactSeller(BuildContext context) {
    CustomSnackBar.customSnackBar(
      context: context,
      title:
          ' سيتم تفعيل خاصية التواصل مع البائع قريباً في حال كان هناك Endponint خاصه في جيب بيانات المستخدم من خلال Id',
    );
  }
}
