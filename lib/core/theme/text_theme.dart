import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme theme() {
    return TextTheme(
      displayLarge: GoogleFonts.poppins(fontSize: 56.sp),
      displayMedium: GoogleFonts.poppins(fontSize: 48.sp),
      displaySmall: GoogleFonts.poppins(fontSize: 36.sp),
      headlineLarge: GoogleFonts.poppins(fontSize: 32.sp),
      headlineMedium: GoogleFonts.poppins(fontSize: 28.sp),
      headlineSmall: GoogleFonts.poppins(fontSize: 24.sp),
      titleLarge: GoogleFonts.poppins(fontSize: 22.sp),
      titleMedium: GoogleFonts.poppins(fontSize: 20.sp),
      titleSmall: GoogleFonts.poppins(fontSize: 18.sp),
      bodyLarge: GoogleFonts.poppins(fontSize: 16.sp),
      bodyMedium: GoogleFonts.poppins(fontSize: 14.sp),
      bodySmall: GoogleFonts.poppins(fontSize: 12.sp),
      labelLarge: GoogleFonts.poppins(fontSize: 10.sp),
      labelMedium: GoogleFonts.poppins(fontSize: 8.sp),
      labelSmall: GoogleFonts.poppins(fontSize: 6.sp),
    );
  }
}
