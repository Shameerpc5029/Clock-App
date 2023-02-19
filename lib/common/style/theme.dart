import 'package:clock_app/common/style/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: AppColors().backgroundLightColor,
    ),
    scaffoldBackgroundColor: AppColors().backgroundLightColor,
    useMaterial3: true,
    primaryColor: AppColors().backgroundLightColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(),
      titleLarge: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Colors.black,
      ),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors().backgroundDarkColor,
    primaryColor: AppColors().backgroundDarkColor,
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: AppColors().backgroundDarkColor,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: Colors.white,
      ),
    ),
    useMaterial3: true,
  );
}
