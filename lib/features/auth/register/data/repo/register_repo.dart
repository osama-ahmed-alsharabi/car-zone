import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/core/model/user_model.dart';

abstract class RegisterRepo {
  Future<BackendResult<String, String>> registerEmailAndPasswordWithFirebase({
    required UserModel user,
  });
}
