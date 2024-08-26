import 'package:flutter/material.dart';
import 'package:news_app/core/theme/color_palette.dart';

class ApplicationThemeManager {
  static ThemeData lightThemeData = ThemeData(
    primaryColor: ColorPalette.primaryColor,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 22,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w400,
        color: ColorPalette.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w700,
        color: ColorPalette.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 22,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w700,
        color: ColorPalette.white,
      ),
      bodySmall: TextStyle(
        fontSize: 22,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w400,
        color: ColorPalette.white,
      ),
      displaySmall: TextStyle(
        fontSize: 10,
        fontFamily: 'Exo',
        color: ColorPalette.customGrey,
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w400,
        color: ColorPalette.black,
      ),
    ),
  );
}
