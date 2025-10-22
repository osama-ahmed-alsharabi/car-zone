import 'package:car_zone/core/helpers/api_helper.dart';
import 'package:car_zone/core/helpers/backend_result.dart';
import 'package:car_zone/core/errors/firebase_error_helper.dart';
import 'package:car_zone/core/model/user_model.dart';
import 'package:car_zone/features/auth/login/data/repo/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginImp extends LoginRepo {
  final FirebaseAuth firebaseAuth;
  final ApiHelper apiHelper;

  LoginImp({required this.firebaseAuth, required this.apiHelper});
  @override
  Future<BackendResult<String, String>> loginWithEmailAndPasswordWithFirebase({
    required UserModel user,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password!,
      );
      return Success("تم تسجيل الدخول بنجاح");
    } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseErrorHandler.getErrorMessage(e);
      return Failure(errorMessage);
    }
  }

  @override
  Future<BackendResult<String, String>> loginWithGoogleAccount() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return Failure("تم إلغاء العملية ");
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseAuth.signInWithCredential(credential);

      return Success("تم تسجيل الدخول بواسطة Google بنجاح");
    } on FirebaseAuthException catch (e) {
      final errorMessage = FirebaseErrorHandler.getErrorMessage(e);
      return Failure(errorMessage);
    } catch (e) {
      return Failure("فشل تسجيل الدخول عبر Google:");
    }
  }

  @override
  Future<BackendResult<UserModel, String>>
  loginWithEmailAndPasswordWithBackend({required UserModel user}) async {
    final result = await apiHelper.post(
      endPoint: "login",
      accept: "application/json",
      contentType: "application/json",
      data: user.toJson(),
    );
    if (result is Success) {
      return Success(UserModel.fromJson((result as Success).value["user"]));
    } else {
      return Failure((result as Failure).error);
    }
  }
}
