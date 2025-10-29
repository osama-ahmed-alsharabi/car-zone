import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/core/widgets/custom_dropdown_form_field_widget.dart';
import 'package:car_zone/core/widgets/custom_text_from_field_widget.dart';
import 'package:car_zone/core/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class CreateProductBody extends StatefulWidget {
  const CreateProductBody({super.key});

  @override
  State<CreateProductBody> createState() => _CreateProductBodyState();
}

class _CreateProductBodyState extends State<CreateProductBody> {
  // Dropdown data
  final List<String> fuelItems = ["بترول", "غاز", "ديزل", "كهرباء", "هجين"];
  final List<String> selnderItems = ["4", "6", "8", "10", "12"];
  final List<String> conditionItems = ["جديدة", "مستعملة", "مصدومة"];
  final List<String> brandItems = [
    "تويوتا",
    "هيونداي",
    "نيسان",
    "مرسيدس",
    "هوندا",
  ];
  final List<String> provinceItems = ["صنعاء", "عدن", "تعز", "حضرموت", "إب"];
  final List<String> districtItems = [
    "التحرير",
    "السبعين",
    "الزهرة",
    "كريتر",
    "خور مكسر",
  ];

  // Selected values
  String? fuelSelect;
  String? selnderSelect;
  String? conditionSelect;
  String? brandSelect;
  String? provinceSelect;
  String? districtSelect;

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text(
            "ابدأ البيع بخطوة بسيطة… والباقي علينا!",
            style: context.textStyle.text18SemiBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 30),
          CustomTextFormFieldWidget(
            controller: nameController,
            labelText: "اسم السيارة",
            icon: Icons.title,
          ),
          const SizedBox(height: 20),
          CustomTextFormFieldWidget(
            controller: descriptionController,
            maxLines: 5,
            labelText: "وصف السيارة",
            icon: Icons.description,
          ),
          const SizedBox(height: 15),
          CustomTextFormFieldWidget(
            controller: modelController,
            keyboardType: TextInputType.number,
            labelText: "موديل السيارة",
            icon: Icons.model_training_rounded,
          ),
          const SizedBox(height: 15),
          CustomTextFormFieldWidget(
            controller: priceController,
            keyboardType: TextInputType.number,
            labelText: "سعر السيارة",
            icon: Icons.money,
          ),
          const SizedBox(height: 15),
          CustomDropdownFormFieldWidget(
            value: brandSelect,
            labelText: "الماركة",
            icon: Icons.directions_car,
            items: brandItems,
            onChanged: (value) {
              brandSelect = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          CustomDropdownFormFieldWidget(
            value: fuelSelect,
            labelText: "نوع الوقود",
            icon: Icons.local_gas_station,
            items: fuelItems,
            onChanged: (value) {
              fuelSelect = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          CustomDropdownFormFieldWidget(
            value: selnderSelect,
            labelText: "عدد السلندرات",
            icon: Icons.settings,
            items: selnderItems,
            onChanged: (value) {
              selnderSelect = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          CustomDropdownFormFieldWidget(
            value: conditionSelect,
            labelText: "حالة السيارة",
            icon: Icons.directions_car_filled_outlined,
            items: conditionItems,
            onChanged: (value) {
              conditionSelect = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          CustomDropdownFormFieldWidget(
            value: provinceSelect,
            labelText: "المحافظة",
            icon: Icons.map_outlined,
            items: provinceItems,
            onChanged: (value) {
              provinceSelect = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 15),
          CustomDropdownFormFieldWidget(
            value: districtSelect,
            labelText: "المديرية",
            icon: Icons.location_city,
            items: districtItems,
            onChanged: (value) {
              districtSelect = value;
              setState(() {});
            },
          ),
          const SizedBox(height: 30),
          Text("صور السيارة", style: context.textStyle.text16Regular),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildImageBox("الصورة الرئيسية")),
              const SizedBox(width: 10),
              Expanded(child: _buildImageBox("صورة فرعية")),
            ],
          ),
          const SizedBox(height: 40),
          CustomButtonWidget(text: "إضافة السيارة", onPressed: () {}),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildImageBox(String title) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white54),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_photo_alternate_outlined,
              color: Colors.white70,
              size: 35,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
