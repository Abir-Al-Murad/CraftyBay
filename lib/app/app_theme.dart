import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightThemeData => ThemeData(
    colorSchemeSeed: AppColors.themeColor,scaffoldBackgroundColor: Colors.white,
    filledButtonTheme: _filledButtonThemeData,
    inputDecorationTheme: _inputhDecorationThemeData,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,

      ),titleMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,


      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 18,color: Colors.black)
    )
  );

  static ThemeData get darkThemeData => ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    brightness: Brightness.dark,
    filledButtonTheme: _filledButtonThemeData,
    inputDecorationTheme: _inputhDecorationThemeData,
  );

  static FilledButtonThemeData get _filledButtonThemeData => FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        textStyle: TextStyle(
            fontSize: 16,
            color: Colors.white
        ),
        backgroundColor: AppColors.themeColor,
        fixedSize: Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      )
  );
  static InputDecorationTheme get _inputhDecorationThemeData => InputDecorationTheme(
    hintStyle: TextStyle(
      fontWeight: FontWeight.w300,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 0),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.themeColor),
    ),enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.themeColor),
  ),focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.themeColor),
  ),
  );
}
