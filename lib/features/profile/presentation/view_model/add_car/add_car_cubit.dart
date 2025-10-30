import 'dart:io';
import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/features/profile/data/repo/add_car_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:car_zone/features/home/data/model/images_model.dart';
import 'add_car_state.dart';

class AddCarCubit extends Cubit<AddCarState> {
  final AddCarRepo repo;
  AddCarCubit(this.repo) : super(AddCarInitial());

  File? selectedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      emit(AddCarImagePicked(selectedImage!));
    }
  }

  Future<void> createProduct({
    required String title,
    required String description,
    required String model,
    required String price,
    required String condition,
    required String engineCylinders,
    required String fuelType,
    required int brandId,
    required int provinceId,
    required int userId,
  }) async {
    if (selectedImage == null) {
      emit(AddCarFailure("الرجاء اختيار صورة أولاً"));
      return;
    }

    emit(AddCarLoading());

    final carModel = CarModel(
      title: title,
      description: description,
      model: model,
      price: price,
      condition: condition,
      engineCylinders: engineCylinders,
      fuelType: fuelType,
      brandId: brandId,
      provinceId: provinceId,
      userId: userId,
      images: ImagesModel(mainImage: ""),
    );

    final result = await repo.createProduct(carModel, selectedImage!);

    if (result is Success) {
      return emit(AddCarSuccess((result as Success).value));
    } else {
      return emit(AddCarFailure((result as Failure).error));
    }
  }
}
