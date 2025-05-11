import 'package:evently_c14/core/theme/app_colros.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light = ThemeData(
      scaffoldBackgroundColor: AppColors.light,
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.dark,
      primaryColorLight: AppColors.light,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.grey,fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          )
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 26,
        ),
        bodyMedium: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 22,
        ),
        bodySmall: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 18,
        ),
      ));

  static ThemeData dark = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0
      ),
      scaffoldBackgroundColor: AppColors.dark,
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.light,
      primaryColorLight: AppColors.dark,

      inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.grey,fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppColors.primary
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppColors.primary
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppColors.primary
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: AppColors.primary
            ),
          )
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 26,
        ),
        bodyMedium: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 22,
        ),
        bodySmall: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 18,
        ),
      ));
}
