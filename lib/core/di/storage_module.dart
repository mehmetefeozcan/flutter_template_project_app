import 'package:flutter_template_project_app/core/storage/hive_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class StorageModule {
  @lazySingleton
  HiveService get hiveService => HiveService();
}
