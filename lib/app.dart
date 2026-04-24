import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_template_project_app/core/routing/app_router.dart';
import 'package:flutter_template_project_app/core/state/theme_store.dart';
import 'package:flutter_template_project_app/core/theme/app_theme.dart';
import 'package:flutter_template_project_app/core/di/locator.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeStore = getIt<ThemeStore>();
    final appTheme = getIt<AppTheme>();

    return ScreenUtilInit(
      designSize: const Size(402, 874),
      splitScreenMode: false,
      minTextAdapt: true,
      builder: (context, child) => RootRestorationScope(
        restorationId: 'root',
        child: Observer(
          builder: (_) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: appTheme.lightTheme,
            darkTheme: appTheme.darkTheme,
            themeMode: themeStore.themeMode,
          ),
        ),
      ),
    );
  }
}
