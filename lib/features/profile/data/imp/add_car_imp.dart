import 'dart:io';
import 'package:car_zone/core/helpers/api_helper.dart';
import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/core/helpers/secure_token_storage.dart';
import 'package:car_zone/core/helpers/service_locator.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:car_zone/features/profile/data/repo/add_car_repo.dart';
import 'package:dio/dio.dart';

class AddCarImp extends AddCarRepo {
  final ApiHelper api;

  AddCarImp({required this.api});

  @override
  Future<BackendResult<String, String>> createProduct(
    CarModel carModel,
    File imageFile,
  ) async {
    String? token = await getIt.get<SecureTokenStorage>().getToken();

    final formData = FormData.fromMap({
      'title': carModel.title,
      'description': carModel.description,
      'model_car': carModel.model,
      'price': carModel.price,
      'car_status': carModel.condition,
      'engine_number': carModel.engineCylinders,
      'fuel_type': carModel.fuelType,
      'brand_id': carModel.brandId,
      'province_id': carModel.provinceId,
      'user_id': carModel.userId,
      'main_image': await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split('/').last,
      ),
    });

    final result = await api.post(
      endPoint: "products",
      accept: "application/json",
      contentType: "multipart/form-data",
      token: token,
      data: formData,
    );

    if (result is Success) {
      return Success(" تم إرسال السيارة بنجاح");
    } else {
      return Failure(" حدث خطأ أثناء الإرسال");
    }
  }
}
