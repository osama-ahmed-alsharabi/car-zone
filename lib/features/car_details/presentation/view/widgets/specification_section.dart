import 'package:car_zone/features/car_details/presentation/view/widgets/custom_divider.dart';
import 'package:car_zone/features/car_details/presentation/view/widgets/specification_item.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:flutter/material.dart';

class SpecificationsSection extends StatelessWidget {
  final CarModel car;

  const SpecificationsSection({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المواصفات',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[100]!),
          ),
          child: Column(
            children: [
              SpecificationItem(
                icon: Icons.directions_car_outlined,
                title: 'الموديل',
                value: car.model ?? 'غير محدد',
              ),
              const CustomDivider(),
              SpecificationItem(
                icon: Icons.build_circle_outlined,
                title: 'الحالة',
                value: car.condition,
              ),
              const CustomDivider(),
              SpecificationItem(
                icon: Icons.engineering_outlined,
                title: 'اسطوانات المحرك',
                value: '${car.engineCylinders} اسطوانات',
              ),
              const CustomDivider(),
              SpecificationItem(
                icon: Icons.local_gas_station_outlined,
                title: 'نوع الوقود',
                value: car.fuelType,
              ),
              const CustomDivider(),
              SpecificationItem(
                icon: Icons.business_center_outlined,
                title: 'البراند',
                value: 'البراند ${car.brandId}',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
