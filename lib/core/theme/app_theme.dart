import 'package:flutter/material.dart';
import 'package:wista/core/constants/app_colors.dart';

class AppThemeData {
  AppThemeData._();
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      dividerColor: Colors.white54,
      fontFamily: 'Montserrat',
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black12,
      fontFamily: 'Montserrat',
    );
  }
}
