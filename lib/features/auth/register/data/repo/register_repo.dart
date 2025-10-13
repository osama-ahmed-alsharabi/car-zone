import 'package:car_zone/core/helpers/api_result.dart';
import 'package:car_zone/features/auth/register/data/model/user_model.dart';

abstract class RegisterRepo {
  Future<ApiResult<String, String>> registerEmailAndPasswordWithFirebase({
    required UserModel user,
  });
}
