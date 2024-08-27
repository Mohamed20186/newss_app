import 'package:flutter/material.dart';
import 'package:news_app/core/theme/colors_palette.dart';

class ApplicationThemeManager {
  static ThemeData lightThemeData = ThemeData(
      primaryColor: ColorsPalette.primaryColor,
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 22,
          fontFamily: 'Exo',
          fontWeight: FontWeight.w400,
          color: ColorsPalette.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 24,
          fontFamily: 'Exo',
          fontWeight: FontWeight.w700,
          color: ColorsPalette.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 22,
          fontFamily: 'Exo',
          fontWeight: FontWeight.w700,
          color: ColorsPalette.white,
        ),
        bodySmall: TextStyle(
          fontSize: 22,
          fontFamily: 'Exo',
          fontWeight: FontWeight.w400,
          color: ColorsPalette.white,
        ),
        displaySmall: TextStyle(
          fontSize: 12,
          fontFamily: 'Exo',
          color: ColorsPalette.customGrey,
        ),
        displayMedium: TextStyle(
          fontSize: 15,
          fontFamily: 'Exo',
          fontWeight: FontWeight.w400,
          color: ColorsPalette.black,
        ),
      ),
      iconTheme: const IconThemeData(
        color: ColorsPalette.white,
        size: 35,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsPalette.primaryColor,
        toolbarHeight: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorsPalette.white,
          size: 35,
        ),
      ));
}
