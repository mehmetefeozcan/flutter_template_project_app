import 'package:hive/hive.dart';
import 'hive_boxes.dart';

class HiveService {
  Box get _appBox => Hive.box(HiveBoxes.app);

  Future<void> setApp(String key, dynamic value) async {
    await _appBox.put(key, value);
  }

  T? getApp<T>(String key) {
    return _appBox.get(key) as T?;
  }

  Future<void> deleteApp(String key) async {
    await _appBox.delete(key);
  }

  bool containsApp(String key) => _appBox.containsKey(key);
}
