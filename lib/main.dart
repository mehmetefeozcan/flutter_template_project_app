import 'package:flutter_template_project_app/core/storage/hive_initializer.dart';
import 'package:flutter_template_project_app/core/di/locator.dart';
import 'package:flutter_template_project_app/app.dart';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Future<void> main() async {
  // System Configuration
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // DI Configuration
  await HiveInitializer.init();
  await configureDependencies();

  runApp(const MyApp());
}
