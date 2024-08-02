import 'package:flutter/material.dart';

class AppDim {
  static const k40 = 40.0;
  static const k35 = 35.0;
  static const k30 = 30.0;
  static const k25 = 25.0;
  static const k24 = 24.0;
  static const k22 = 22.0;
  static const k20 = 20.0;
  static const k18 = 18.0;
  static const k16 = 16.0;
  static const k14 = 14.0;
  static const k12 = 12.0;
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
