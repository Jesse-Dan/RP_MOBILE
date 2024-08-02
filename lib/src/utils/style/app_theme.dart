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
      appBarTheme: AppBarTheme(
          foregroundColor: AppColors.kprimaryColor400,
          surfaceTintColor: AppColors.kprimaryColor400,
          elevation: 0),
      useMaterial3: true,
      primaryColorLight: AppColors.kprimaryColor700,
      textTheme: getTextTheme(),
      primaryTextTheme: getTextTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static darkThemeData(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
          foregroundColor: AppColors.kprimaryColor400,
          surfaceTintColor: AppColors.kprimaryColor400,
          elevation: 0),
      useMaterial3: true,
      primaryColorLight: AppColors.kprimaryColor700.withOpacity(0.6),
      textTheme: getTextTheme(),
      primaryTextTheme: getTextTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
  static TextTheme getTextTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xFF232323),
        fontSize: 57,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      displayMedium: TextStyle(
        color: Color(0xFF232323),
        fontSize: 45,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        color: Color(0xFF232323),
        fontSize: 36,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: TextStyle(
        color: Color(0xFF232323),
        fontSize: 32,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: Color(0xFF232323),
        fontSize: 28,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        color: Color(0xFF232323),
        fontSize: 24,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        color: Color(0xFF232323),
        fontSize: 22,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF232323),
        fontSize: 16,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: Color(0xFF232323),
        fontSize: 14,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w200,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFF232323),
        fontSize: 16,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF232323),
        fontSize: 14,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        color: Color(0xFF232323),
        fontSize: 12,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w700,
      ),
      labelLarge: TextStyle(
        color: Color(0xFF232323),
        fontSize: 14,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: Color(0xFF232323),
        fontSize: 12,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
        color: Color(0xFF232323),
        fontSize: 11,
        fontFamily: "DM Sans",
        fontWeight: FontWeight.w500,
      ),
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
