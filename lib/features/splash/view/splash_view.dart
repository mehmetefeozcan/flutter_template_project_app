import 'package:flutter_template_project_app/core/routing/routes/main/main_routes.dart';
import 'package:flutter_template_project_app/features/splash/store/splash_store.dart';
import 'package:flutter_template_project_app/core/base/base_view.dart';
import 'package:flutter_template_project_app/core/di/locator.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with BaseViewMixin<SplashView> {
  @override
  late final SplashStore store;

  @override
  Future<void> onInit() async {
    store = getIt<SplashStore>();

    addReaction(
      reaction<bool>((_) => store.navigateToHome, (navigateToHome) {
        if (navigateToHome) {
          context.go(MainRoutes.home);
        }
      }),
    );

    await store.initApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Center(child: Text('Splash View')),
    );
  }
}
