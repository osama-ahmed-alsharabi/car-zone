import 'package:flutter/material.dart';

class CustomDropdownFormFieldWidget extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final List<String> items;
  final String? value;
  final void Function(String?)? onChanged;

  const CustomDropdownFormFieldWidget({
    super.key,
    required this.labelText,
    required this.icon,
    required this.items,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      dropdownColor: Colors.black87,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        enabledBorder: border(),
        focusedBorder: border(),
        errorBorder: border(color: Colors.red),
        focusedErrorBorder: border(color: Colors.red),
      ),
      iconEnabledColor: Colors.white70,
      style: const TextStyle(color: Colors.white),
      items: items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: const TextStyle(color: Colors.white)),
            ),
          )
          .toList(),
    );
  }

  OutlineInputBorder border({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.white70),
    );
  }
}
