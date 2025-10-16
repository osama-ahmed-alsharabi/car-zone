import 'package:car_zone/core/helpers/api_result.dart';
import 'package:car_zone/core/model/user_model.dart';
import 'package:car_zone/features/auth/login/data/repo/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginImp extends LoginRepo {
  @override
  Future<ApiResult<String, String>> loginWithEmailAndPassword({
    required UserModel user,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return Success("تم تسجيل الدخول بنجاح");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Failure("لايوجد حساب بهذا الايميل");
      } else if (e.code == 'wrong-password') {
        return Failure("كلمة السر غير صحيحة");
      }
      return Failure("حدث خطاء غير معروف الرجاء المحاولة لاحقا");
    }
  }

  @override
  Future<ApiResult<String, String>> loginWithGoogleAccount() {
    throw UnimplementedError();
  }
}
