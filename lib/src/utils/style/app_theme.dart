// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme extends AppColors {
  AppTheme(super.hexColor);

  static bool isLightMode(BuildContext context) {
    var currentTheme = Theme.of(context).brightness;
    switch (currentTheme) {
      case Brightness.dark:
        return false;
      case Brightness.light:
        return true;
      default:
        return false;
    }
  }

  static bool isDarkMode(BuildContext context) {
    var currentTheme = Theme.of(context).brightness;
    switch (currentTheme) {
      case Brightness.dark:
        return true;
      case Brightness.light:
        return false;
      default:
        return false;
    }
  }

 static  Color userColor({
    required Color? darkColor,
    required Color? lightColor,
    required BuildContext context,
  }) {
    if (isDarkMode(context)) {
      return darkColor!;
    } else if (isLightMode(context)) {
      return lightColor!;
    } else {
      throw Exception('determine light and dark mode colors');
    }
  }

  static lightThemeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
   
      textTheme: getTextTheme(),
      primaryTextTheme: getTextTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static darkThemeData(BuildContext context) {
     return ThemeData(
      useMaterial3: true,
   
      textTheme: getTextTheme(),
      primaryTextTheme: getTextTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static TextTheme getTextTheme() {
    return const TextTheme(
      bodyText1: TextStyle(fontFamily: "Aeonik"),
      bodyText2: TextStyle(fontFamily: "Aeonik"),
      headline1: TextStyle(fontFamily: "Aeonik"),
      headline2: TextStyle(fontFamily: "Aeonik"),
      headline3: TextStyle(fontFamily: "Aeonik"),
      headline4: TextStyle(fontFamily: "Aeonik"),
      headline5: TextStyle(fontFamily: "Aeonik"),
      headline6: TextStyle(fontFamily: "Aeonik"),
      subtitle1: TextStyle(fontFamily: "Aeonik"),
      subtitle2: TextStyle(fontFamily: "Aeonik"),
      button: TextStyle(fontFamily: "Aeonik"),
      caption: TextStyle(fontFamily: "Aeonik"),
      overline: TextStyle(fontFamily: "Aeonik"),
    );
  }

//
// const kDeepPurple = Color(0xffF76C6C);
//
// const kSecondaryColor = Color(0xFFFE9901);
// const kContentColorLightTheme = Color(0xFF1D1D35);
// const kContentColorDarkTheme = Color(0xFFF5FCF9);
  static const kWarningColor = Color(0xFFF3BB1C);
  static const kErrorColor = Color(0xFFF03738);

  static const kDefaultPaddinglogs = 20.0;

  static const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
}