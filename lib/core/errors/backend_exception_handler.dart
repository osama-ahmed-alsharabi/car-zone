enum BackendExceptionHandler {
  emailAlreadyTaken,
  invalidEmailOrPassword,
  unknown,
}

extension BackendExceptionHandlerX on BackendExceptionHandler {
  static BackendExceptionHandler fromResponse(dynamic errorData) {
    if (errorData is Map && errorData.containsKey('message')) {
      final message = (errorData['message'] as String).toLowerCase();
      if (message.contains('email has already been taken')) {
        return BackendExceptionHandler.emailAlreadyTaken;
      } else if (message.contains('invalid email or password')) {
        return BackendExceptionHandler.invalidEmailOrPassword;
      }
    }

    if (errorData is Map && errorData.containsKey('errors')) {
      final errors = errorData['errors'] as Map<String, dynamic>;
      if (errors['email'] != null &&
          errors['email'].toString().toLowerCase().contains(
            'already been taken',
          )) {
        return BackendExceptionHandler.emailAlreadyTaken;
      }
    }

    return BackendExceptionHandler.unknown;
  }

  String get message {
    switch (this) {
      case BackendExceptionHandler.emailAlreadyTaken:
        return "البريد الإلكتروني مستخدم مسبقًا.";
      case BackendExceptionHandler.invalidEmailOrPassword:
        return "البريد الإلكتروني أو كلمة المرور غير صحيحة.";
      case BackendExceptionHandler.unknown:
        return "حدث خطأ غير متوقع. يرجى المحاولة لاحقًا.";
    }
  }
}
