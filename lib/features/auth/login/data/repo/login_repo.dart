import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/core/model/user_model.dart';

abstract class LoginRepo {
  Future<BackendResult<String, String>> loginWithEmailAndPasswordWithFirebase({
    required UserModel user,
  });

  Future<BackendResult<UserModel, String>> loginWithEmailAndPasswordWithBackend({
    required UserModel user,
  });

  Future<BackendResult<String, String>> loginWithGoogleAccount();
}
