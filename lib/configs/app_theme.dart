import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyLarge: GoogleFonts.roboto(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    displayLarge: GoogleFonts.roboto(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: GoogleFonts.roboto(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 26.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.roboto(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyLarge: GoogleFonts.roboto(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    displayLarge: GoogleFonts.roboto(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displayMedium: GoogleFonts.roboto(
      fontSize: 28.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 26.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.roboto(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      colorScheme: const ColorScheme.light(primary: primaryColor),
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      // primarySwatch: primaryMaterialColor,
      fontFamily: 'Roboto',
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.teal;
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
      )),
      dividerTheme: DividerThemeData(
        color: Colors.grey.withOpacity(0.8),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
      ),
      textTheme: lightTextTheme,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: lightTextTheme.bodyMedium?.copyWith(
          color: const Color(0xFF6E7A82),
          fontWeight: FontWeight.w400,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      dividerTheme: const DividerThemeData(
        color: Colors.grey,
      ),
      colorScheme: const ColorScheme.dark(primary: primaryColor),
      useMaterial3: true,
      brightness: Brightness.dark,
      dividerColor: Colors.grey,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
      ),
      textTheme: darkTextTheme,
    );
  }
}
