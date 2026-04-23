import 'package:flutter_template_project_app/core/theme/app_theme_colors.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_theme.dart';

@singleton
class AppTheme {
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.secondary,
      textTheme: AppTextTheme.theme(),
      colorScheme: AppThemeColors.light,
    );
  }

  // DARK THEME
  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.secondary,
      textTheme: AppTextTheme.theme(),
      colorScheme: AppThemeColors.dark,
    );
  }
}
