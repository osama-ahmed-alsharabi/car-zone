import 'dart:io';

import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';

abstract class AddCarRepo{
  Future<BackendResult<String , String>> createProduct(CarModel carModel ,  File imageFile);
}