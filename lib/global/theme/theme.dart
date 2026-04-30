import 'package:delivery_live_tracking/gen/fonts.gen.dart';
import 'package:delivery_live_tracking/global/extensions/color_extension.dart';
import 'package:delivery_live_tracking/global/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
    fontFamily: FontFamily.inter,
    scaffoldBackgroundColor: AppColors.white,
    colorSchemeSeed: AppColors.primary,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        height: 1.4,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w600,
        color: AppColors.neutralColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
        height: 1.5,
        letterSpacing: 0.4,
        color: AppColors.neutralColor.o(90),
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        height: 1.0,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w500,
        color: AppColors.neutralColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        height: 1.14,
        letterSpacing: 0.4,
        color: AppColors.neutralColorBody,
      ),
    ),
  );
}
