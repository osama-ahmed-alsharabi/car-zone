import 'package:car_zone/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldPasswordWidget extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextFormFieldPasswordWidget({
    super.key,
    required this.labelText,
    required this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.validator,
  });

  @override
  State<CustomTextFormFieldPasswordWidget> createState() =>
      _CustomTextFormFieldPasswordWidgetState();
}

class _CustomTextFormFieldPasswordWidgetState
    extends State<CustomTextFormFieldPasswordWidget> {
  bool isVisibility = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: isVisibility,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            isVisibility = !isVisibility;
            setState(() {});
          },
          icon: Icon(
            isVisibility ? Icons.visibility_off : Icons.visibility,
            color: Colors.white70,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(widget.icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        enabledBorder: border(),
        errorBorder: border(color: AppColors.errorColor),
        focusedBorder: border(),
        focusedErrorBorder: border(color: AppColors.errorColor),
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
