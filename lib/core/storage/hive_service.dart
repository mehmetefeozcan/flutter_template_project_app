import 'package:hive/hive.dart';

class HiveService {
  final Box box;

  HiveService(this.box);

  T? get<T>(String key, {T? defaultValue}) {
    return box.get(key, defaultValue: defaultValue) as T?;
  }

  Future<void> set<T>(String key, T value) async {
    await box.put(key, value);
  }

  Future<void> delete(String key) async {
    await box.delete(key);
  }

  Future<void> clear() async {
    await box.clear();
  }
}
