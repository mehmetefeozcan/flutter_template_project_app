import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  static const emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$";
}
