import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/features/home/data/model/brand_model.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';

abstract class HomeRepo {
  Future<BackendResult<List<BrandModel>, String>> getBarnd();
  Future<BackendResult<List<CarModel>, String>> getCars();
}
