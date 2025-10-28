import 'package:car_zone/core/database/dao/brand_local_data_source.dart';
import 'package:car_zone/core/database/dao/car_local_data_source.dart';
import 'package:car_zone/core/helpers/api_helper.dart';
import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/features/home/data/model/brand_model.dart';
import 'package:car_zone/features/home/data/model/car_model.dart';
import 'package:car_zone/features/home/data/repo/home_repo.dart';

class HomeImp extends HomeRepo {
  final ApiHelper api;
  final BrandLocalDataSource brandLocalDataSource;
  final CarLocalDataSource localDataSource;

  HomeImp({
    required this.api,
    required this.localDataSource,
    required this.brandLocalDataSource,
  });
  @override
  Future<BackendResult<List<BrandModel>, List<BrandModel>>> getBarnd() async {
    BackendResult result = await api.get(
      endPoint: "brands",
      contentType: "",
      accept: "",
    );
    List<BrandModel> brands;
    if (result is Success) {
      brands = (result.value as List<dynamic>)
          .map((e) => BrandModel.fromJson(e))
          .toList();
      await brandLocalDataSource.cacheBrands(brands);
      return Success(brands);
    } else {
      brands = await brandLocalDataSource.getCachedBrands();
      return Failure(brands);
    }
  }

  @override
  Future<BackendResult<List<CarModel>, List<CarModel>>> getCars() async {
    BackendResult result = await api.get(
      endPoint: "products",
      contentType: "",
      accept: "",
    );
    List<CarModel> cars;
    if (result is Success) {
      cars = (result.value["data"] as List<dynamic>)
          .map((e) => CarModel.fromJson(e))
          .toList();
      await localDataSource.cacheCars(cars);
      return Success(cars);
    } else {
      cars = await localDataSource.getCachedCars();
      return Failure(cars);
    }
  }
}
