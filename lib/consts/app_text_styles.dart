import 'app_colors.dart';
import 'app_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyle {

  static TextStyle lobsterFontStyleDodgerBlueColor({
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: AppFonts.lobsterFont,
      fontSize: fontSize,
      color: AppColors.darkBlue,
    );
  }

  static TextStyle lobsterFontStyle({
    required double fontSize,
    required bool bold,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.openSansFont,
      color: color,
      fontSize: fontSize,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
  }

}


