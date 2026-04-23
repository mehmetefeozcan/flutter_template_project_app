import 'package:hive_flutter/hive_flutter.dart';
import 'hive_boxes.dart';

class HiveInitializer {
  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox(HiveBoxes.app);
  }
}
