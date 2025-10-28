import 'package:flutter/material.dart';

class SettingModel {
  final String title;
  final IconData icon;
  final Function()? onTap;

  SettingModel({required this.title, required this.icon, required this.onTap});
}
