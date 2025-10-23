import 'package:car_zone/core/helpers/api_helper.dart';
import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/features/home/data/model/brand_model.dart';
import 'package:car_zone/features/home/data/repo/home_repo.dart';

class HomeImp extends HomeRepo {
  final ApiHelper api;

  HomeImp({required this.api});
  @override
  Future<BackendResult<BrandModel, String>> getBarnd() async {
    BackendResult result = await api.get(
      endPoint: "endPoint",
      contentType: "",
      accept: "",
    );
    if (result is Success) {
      return Success(BrandModel.fromJson((result).value));
    } else {
      return Failure("error");
    }
  }
}
