import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static const Color lightPrimaryColor = Color(0xFFFFFFFF);
  static const Color lightOnPrimaryColor = Color(0xFF004182);
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: lightPrimaryColor,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: lightOnPrimaryColor),
      textTheme: TextTheme(
        labelSmall: GoogleFonts.poppins(
            color: lightOnPrimaryColor, fontWeight: FontWeight.w300),
        labelMedium: GoogleFonts.poppins(
            color: lightOnPrimaryColor, fontWeight: FontWeight.w500),
        labelLarge: GoogleFonts.poppins(
            color: lightOnPrimaryColor, fontWeight: FontWeight.w600),
      ),
      snackBarTheme: SnackBarThemeData(
          backgroundColor: lightOnPrimaryColor,
          contentTextStyle: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: lightPrimaryColor),
          behavior: SnackBarBehavior.floating));
}
