import 'package:car_zone/core/helpers/api_result.dart';
import 'package:car_zone/features/auth/register/data/model/user_model.dart';
import 'package:car_zone/features/auth/register/data/repo/register_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepoImp extends RegisterRepo {
  @override
  Future<ApiResult<String, String>> registerEmailAndPasswordWithFirebase({
    required UserModel user,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );
      await userCredential.user?.updateDisplayName(user.fullName);
      return Success("تم تسجيل الدخول بنجاح");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Failure("كلمة المرور ضعيفة ");
      } else if (e.code == 'email-already-in-use') {
        return Failure("الحساب مستخدم بالفعل ");
      }
      return Failure("حدث خطاء غير معروف الرجاء المحاولة لاحقا");
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
