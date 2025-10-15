
import 'package:flutter/material.dart';

class ValidatorHelper {
  static String? validateRequired(
    String? value, {
    String? fieldName,
    required BuildContext context,
  }) {
    if (value == null || value.trim().isEmpty) {
      return fieldName != null ? 'الرجاء إدخال $fieldName' : '';
    }
    return null;
  }

  static String? validateEmail(String? value, {required BuildContext context}) {
    final v = value?.trim() ?? '';
    if (v.isEmpty) return "الايميل مطلوب";

    final emailRegex = RegExp(
      r'^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,24}$',
      caseSensitive: false,
    );

    if (!emailRegex.hasMatch(v)) {
      return "الايميل غير صالح";
    }
    return null;
  }

  static String? validatePassword(
    String? value, {
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return "الرجاء ادخال الباسورد";
    }
    if (value.length < 6) {
      return "يجب على الاقل ان تتكون كملة المرور من 6 احرف او ارقام";
    }
    return null;
  }
}