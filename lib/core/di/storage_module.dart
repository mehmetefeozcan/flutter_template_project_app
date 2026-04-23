import 'package:flutter_template_project_app/core/storage/hive_service.dart';
import 'package:flutter_template_project_app/core/storage/hive_boxes.dart';

import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';

@module
abstract class StorageModule {
  @preResolve
  Future<Box> settingsBox() => Hive.openBox(HiveBoxes.settings);

  @lazySingleton
  HiveService settingsStorage(Box settingsBox) => HiveService(settingsBox);
}
