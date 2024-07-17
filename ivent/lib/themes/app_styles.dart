import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ivent/themes/app_theme.dart';

class AppStyles {
  static TextStyle buttonStyle = GoogleFonts.tajawal(
    textStyle: TextStyle(
        fontSize: 17.sp, fontWeight: FontWeight.bold, fontFamily: 'Mostaajel'),
  );
  static TextStyle bodyStyle = GoogleFonts.tajawal(
    textStyle: TextStyle(
      fontSize: 15.sp,
      color: AppColors.blackColor,
    ),
  );
  static TextStyle placeholder = GoogleFonts.tajawal(
    textStyle: TextStyle(
      fontSize: 14.sp,
      color: AppColors.placeholder,
    ),
  );

  static TextStyle h1({
    double fontSize = 25.0,
    FontWeight fontWeight = FontWeight.bold,
    color = AppColors.blackColor,
  }) {
    return GoogleFonts.tajawal(
        textStyle: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ));
  }

  static TextStyle h2({
    double fontSize = 18.0,
    FontWeight fontWeight = FontWeight.normal,
    color = AppColors.blackColor,
  }) {
    return GoogleFonts.tajawal(
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  static TextStyle text({
    double fontSize = 18.0,
    FontWeight fontWeight = FontWeight.bold,
    Color color = AppColors.blackColor,
  }) {
    return TextStyle(
      fontFamily: 'Basis Grotesque Pro',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle normal({
    double fontSize = 12.0,
    Color color = AppColors.blackColor,
  }) {
    return TextStyle(
      fontFamily: 'Basis Grotesque Pro',
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle number({
    double fontSize = 12.0,
    Color color = AppColors.blackColor,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      color: color,
    );
  }
}
