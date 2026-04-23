import 'package:flutter_template_project_app/core/routing/routes/main/main_routes.dart';

import '/core/constants/app_constants.dart';
import 'routes/main/main_router.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: AppConstants.navigatorKey,
    initialLocation: MainRoutes.splash,
    debugLogDiagnostics: true,
    observers: [routeObserver],
    routes: [...MainRouter.routes],
  );
}
