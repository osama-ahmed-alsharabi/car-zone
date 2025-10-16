import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler {
  static String getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return "البريد الإلكتروني غير صالح";
      case 'user-disabled':
        return "تم تعطيل هذا الحساب";
      case 'user-not-found':
        return "لا يوجد حساب بهذا البريد الإلكتروني";
      case 'wrong-password':
        return "كلمة المرور غير صحيحة";
      case 'email-already-in-use':
        return "البريد مستخدم مسبقًا";
      case 'weak-password':
        return "كلمة المرور ضعيفة جدًا";
      case 'invalid-credential':
        return "تحقق من البريد وكلمة المرور";
      case 'network-request-failed':
        return "تحقق من اتصال الإنترنت";
      case 'too-many-requests':
        return "تم حظر المحاولات مؤقتًا، حاول لاحقًا";
      default:
        return "حدث خطأ غير معروف، حاول مرة أخرى لاحقًا";
    }
  }
}
