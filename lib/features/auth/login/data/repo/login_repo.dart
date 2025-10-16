import 'package:car_zone/core/helpers/api_result.dart';
import 'package:car_zone/core/model/user_model.dart';

abstract class LoginRepo {
  Future<ApiResult<String, String>> loginWithEmailAndPassword({
    required UserModel user,
  });

  Future<ApiResult<String, String>> loginWithGoogleAccount();
}
