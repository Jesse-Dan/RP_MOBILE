import 'package:flutter/material.dart';

class AppNavBarIcon {
  final String img;
  final String selectedImg;
  final VoidCallback? onTap;
  final bool addbadge;
  final String label;

  const AppNavBarIcon(
      {this.addbadge = false,
      required this.img,
      required this.selectedImg,
      this.onTap,
      required this.label});
}
