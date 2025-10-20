import 'package:car_zone/core/helpers/api_helper.dart';
import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/core/helpers/firebase_error_helper.dart';
import 'package:car_zone/core/model/user_model.dart';
import 'package:car_zone/features/auth/register/data/repo/register_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepoImp extends RegisterRepo {
  final ApiHelper apiHelper;

  RegisterRepoImp({required this.apiHelper});

  @override
  Future<BackendResult<String, String>> registerEmailAndPasswordWithFirebase({
    required UserModel user,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password!,
          );
      await userCredential.user?.updateDisplayName(user.fullName);
      return Success("تم تسجيل الدخول بنجاح");
    } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseErrorHandler.getErrorMessage(e);
      return Failure(errorMessage);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<BackendResult<String, String>> registerEmailAndPasswordWithAPI({
    required UserModel user,
  }) async {
    final result = await apiHelper.post(
      contentType: "application/json",
      accept: "application/json",
      data: user.toJson(),
      endPoint: "api/register_by_email",
    );
    if (result is Success) {
      return Success("done");
    } else {
      return Failure("error");
    }
  }
}
