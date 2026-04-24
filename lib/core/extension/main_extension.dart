import 'package:flutter_template_project_app/core/l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

extension MainContextExtension on BuildContext {
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;

  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;

  double get width => 1.sw;
  double get height => 1.sh;

  double get spacingVerticalSmall => 0.05.sh;
  double get spacingVerticalMedium => 0.1.sh;
  double get spacingVerticalHeight => 0.2.sh;

  double get spacingHorizontalSmall => 0.05.sw;
  double get spacingHorizontalMedium => 0.1.sw;
  double get spacingHorizontalHeight => 0.2.sw;

  double get radiusSmall => 8.r;
  double get radiusMedium => 16.r;
  double get radiusLarge => 32.r;

  void unFocusKeyboard() => FocusScope.of(this).unfocus();

  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;

  AppLocalizations get l10n => AppLocalizations.of(this);
}
