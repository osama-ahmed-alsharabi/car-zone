import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/features/home/data/model/brand_model.dart';

abstract class HomeRepo {
  Future<BackendResult<BrandModel, String>> getBarnd();
}
