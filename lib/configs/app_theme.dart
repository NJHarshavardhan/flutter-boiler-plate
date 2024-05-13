import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.openSans(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0.sp,
      fontWeight: FontWeight.w900,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 28.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 26.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline5: GoogleFonts.openSans(
      fontSize: 22.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyText2: GoogleFonts.openSans(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 28.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 26.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline5: GoogleFonts.openSans(
      fontSize: 22.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
    //  primarySwatch: primaryColor,
      fontFamily: 'OpenSans',
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.amber;
        }),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
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

class AppColors {
  static Color uiInitLoginBgColor = const Color(0xffEDEDED);
  static Color uiBlackColor = const Color(0xff0C0D0E);
  static Color uiGreyColor = const Color(0xffEBEBEB);
}
