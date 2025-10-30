import 'dart:io';

import 'package:car_zone/core/helpers/validator_helper.dart';
import 'package:car_zone/core/utils/app_colors.dart';
import 'package:car_zone/core/utils/app_text_style.dart';
import 'package:car_zone/core/widgets/custom_dropdown_form_field_widget.dart';
import 'package:car_zone/core/widgets/custom_text_from_field_widget.dart';
import 'package:car_zone/core/widgets/custom_button_widget.dart';
import 'package:car_zone/features/profile/presentation/view_model/add_car/add_car_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProductBody extends StatefulWidget {
  const CreateProductBody({super.key});

  @override
  State<CreateProductBody> createState() => _CreateProductBodyState();
}

class _CreateProductBodyState extends State<CreateProductBody> {
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
  String? fuelSelect;
  String? selnderSelect;
  String? conditionSelect;
  String? brandSelect;
  File? selectedImage;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
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
              validator: (value) => ValidatorHelper.validateRequired(
                value,
                context: context,
                fieldName: "اسم السيارة",
              ),
              controller: titleController,
              labelText: "اسم السيارة",
              icon: Icons.title,
            ),
            const SizedBox(height: 20),
            CustomTextFormFieldWidget(
              validator: (value) => ValidatorHelper.validateRequired(
                value,
                context: context,
                fieldName: "وصف السيارة",
              ),
              controller: descriptionController,
              maxLines: 5,
              labelText: "وصف السيارة",
              icon: Icons.description,
            ),
            const SizedBox(height: 15),
            CustomTextFormFieldWidget(
              validator: (value) => ValidatorHelper.validateRequired(
                value,
                context: context,
                fieldName: "موديل السيارة",
              ),
              controller: modelController,
              keyboardType: TextInputType.number,
              labelText: "موديل السيارة",
              icon: Icons.model_training_rounded,
            ),
            const SizedBox(height: 15),
            CustomTextFormFieldWidget(
              validator: (value) => ValidatorHelper.validateRequired(
                value,
                context: context,
                fieldName: "سعر السيارة",
              ),
              controller: priceController,
              keyboardType: TextInputType.number,
              labelText: "سعر السيارة",
              icon: Icons.money,
            ),
            const SizedBox(height: 15),
            CustomDropdownFormFieldWidget(
              validator: (value) => ValidatorHelper.validateRequired(
                value,
                context: context,
                fieldName: "الماركة",
              ),
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
              validator: (value) => ValidatorHelper.validateRequired(
                value,
                context: context,
                fieldName: "نوع الوقود",
              ),
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
              validator: (value) => ValidatorHelper.validateRequired(
                value,
                context: context,
                fieldName: "عدد السلندرات",
              ),
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
              validator: (value) => ValidatorHelper.validateRequired(
                value,
                context: context,
                fieldName: "حالة السيارة",
              ),
              value: conditionSelect,
              labelText: "حالة السيارة",
              icon: Icons.directions_car_filled_outlined,
              items: conditionItems,
              onChanged: (value) {
                conditionSelect = value;
                setState(() {});
              },
            ),
            const SizedBox(height: 30),
            Text("صور السيارة", style: context.textStyle.text16Regular),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                await BlocProvider.of<AddCarCubit>(context).pickImage();
                setState(() {});
              },
              child: Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child:
                    BlocProvider.of<AddCarCubit>(context).selectedImage == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add_photo_alternate,
                            size: 60,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "اضغط هنا لاضافة الصورة",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          BlocProvider.of<AddCarCubit>(context).selectedImage!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 40),
            CustomButtonWidget(
              text: "إضافة السيارة",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AddCarCubit>(context).createProduct(
                    title: titleController.text,
                    description: descriptionController.text,
                    model: modelController.text,
                    price: priceController.text,
                    condition: conditionSelect!,
                    engineCylinders: selnderSelect!,
                    fuelType: fuelSelect!,
                    brandId: 1,
                    provinceId: 1,
                  );
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
