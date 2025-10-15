import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextFormFieldWidget({
    super.key,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        enabledBorder: border(),
        errorBorder: border(color: Colors.red),
        focusedBorder: border(),
        focusedErrorBorder: border(color: Colors.red),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  OutlineInputBorder border({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white70),
    );
  }
}
