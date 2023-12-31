import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/utils/colors.dart';

TextTheme textThemeLight() {
  return TextTheme(
    displayLarge: GoogleFonts.heebo(
        height: 1.2,
        fontSize: 34,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: AppColors.black),
    displayMedium: GoogleFonts.heebo(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: AppColors.black),
    displaySmall: GoogleFonts.heebo(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: AppColors.black),
    headlineMedium: GoogleFonts.heebo(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: AppColors.black),
    headlineSmall: GoogleFonts.heebo(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: AppColors.black),
    bodyLarge: GoogleFonts.heebo(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: AppColors.black),
    bodyMedium: GoogleFonts.heebo(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: AppColors.black),
    titleMedium: GoogleFonts.heebo(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: AppColors.black),
    titleSmall: GoogleFonts.heebo(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: AppColors.black),
    bodySmall: GoogleFonts.heebo(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: AppColors.black),
    labelLarge: GoogleFonts.heebo(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: AppColors.white),
    titleLarge: GoogleFonts.heebo(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: const Color(0xff181C1F),
    ),
  );
}
