import 'package:flutter/material.dart';

class AppDimentions {
  static const k20 = 20.0;
  static const k16 = 16.0;
  static const k12 = 12.0;
  static const k14 = 14.0;
  static const k0 = 0.0;

  static buildDimention(double appDimention,
      {double? dimention, String? operation}) {
    if (dimention == null || operation == null) {
      return appDimention;
    } else {
      switch (operation) {
        case '-':
          return appDimention - dimention;
        case '+':
          return appDimention + dimention;
        case '*':
          return appDimention * dimention;
        case '/':
          return appDimention / dimention;
        default:
      }
    }
  }

  static space({double? height, double? width}) =>
      SizedBox(height: height ?? 0, width: width ?? 0);
}
