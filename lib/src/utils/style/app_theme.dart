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

  static Color userColor({
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
      bodyText1: TextStyle(
        color: Color(0xFF232323),
        fontSize: 14,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w700,
      ),
      bodyText2: TextStyle(
        color: Color(0xFF232323),
        fontSize: 14,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle(
        color: Color(0xFF232323),
        fontSize: 32,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      headline1: TextStyle(
        color: Color(0xFF232323),
        fontSize: 32,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      headline3: TextStyle(
        color: Color(0xFF232323),
        fontSize: 32,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      headline4: TextStyle(
        color: Color(0xFF232323),
        fontSize: 32,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      headline5: TextStyle(
        color: Color(0xFF232323),
        fontSize: 32,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      headline6: TextStyle(
        color: Color(0xFF232323),
        fontSize: 32,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      subtitle1: TextStyle(
        color: Color(0xFF232323),
        fontSize: 16,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w400,
      ),
      subtitle2: TextStyle(
        color: Color(0xFF232323),
        fontSize: 15,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w200,
      ),
      button: TextStyle(fontFamily: "DM Sans"),
      caption: TextStyle(fontFamily: "DM Sans"),
      overline: TextStyle(fontFamily: "DM Sans"),
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
