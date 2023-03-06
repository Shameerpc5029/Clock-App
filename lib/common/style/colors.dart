import 'package:flutter/material.dart';

class AppColors {
  static Color backgroundDarkColor = const Color(0xFF2D2F41);
  static Color backgroundLightColor = const Color.fromARGB(255, 227, 227, 239);
  static Color shadowColor = const Color.fromARGB(110, 91, 83, 83);

  static Color clockBG = const Color(0xFF444974);
  static Color clockOutline = const Color(0xFFEAECFF);
  static Color? secHandColor = Colors.orange[300];
  static Color minHandStatColor = const Color(0xFF748EF6);
  static Color minHandEndColor = const Color(0xFF77DDFF);
  static Color hourHandStatColor = const Color(0xFFC279FB);
  static Color hourHandEndColor = const Color(0xFFEA74AB);
}

class GradientColors {
  final List<Color> colors;
  GradientColors(this.colors);

  static List<Color> sky = [const Color(0xFF6448FE), const Color(0xFF5FC6FF)];
  static List<Color> sunset = [
    const Color(0xFFFE6197),
    const Color(0xFFFFB463)
  ];
  static List<Color> sea = [const Color(0xFF61A3FE), const Color(0xFF63FFD5)];
  static List<Color> mango = [const Color(0xFFFFA738), const Color(0xFFFFE130)];
  static List<Color> fire = [const Color(0xFFFF5DCD), const Color(0xFFFF8484)];
}
