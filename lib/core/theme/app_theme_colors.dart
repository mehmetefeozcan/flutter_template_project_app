import 'app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeColors {
  // LIGHT
  static const light = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.white,
    surface: AppColors.white,
    onSurface: AppColors.textDarkGrey,
    error: AppColors.error,
    onError: AppColors.white,
  );

  // DARK
  static const dark = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.softPink,
    onSecondary: AppColors.dark,
    surface: AppColors.dark,
    onSurface: AppColors.lightGrey,
    error: AppColors.error,
    onError: AppColors.white,
  );
}
