import 'package:flutter_template_project_app/core/routing/routes/main/main_routes.dart';
import 'package:flutter_template_project_app/core/routing/custom_transition.dart';
import 'package:go_router/go_router.dart';

// Page Imports
import 'package:flutter_template_project_app/features/splash/view/splash_view.dart';
import 'package:flutter_template_project_app/features/home/view/home_view.dart';

class MainRouter {
  static List<RouteBase> routes = [
    GoRoute(
      path: MainRoutes.splash,
      pageBuilder: (context, state) {
        return RouterTransitionHelper.build(
          state: state,
          child: const SplashView(),
          type: PageTransitionType.fade,
        );
      },
    ),
    GoRoute(
      path: MainRoutes.home,
      pageBuilder: (context, state) {
        return RouterTransitionHelper.build(
          state: state,
          child: const HomeView(),
          type: PageTransitionType.fade,
        );
      },
    ),
  ];
}
