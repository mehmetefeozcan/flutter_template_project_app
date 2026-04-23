import 'package:flutter_template_project_app/core/storage/hive_service.dart';

import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

@singleton
class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final HiveService settingsStorage;

  _ThemeStore(this.settingsStorage);

  static const _key = "isDarkMode";

  @observable
  bool isDarkMode = false;

  @computed
  ThemeMode get themeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  @action
  Future<void> loadTheme() async {
    isDarkMode = settingsStorage.get<bool>(_key, defaultValue: false) ?? false;
  }

  @action
  Future<void> toggleTheme() async {
    isDarkMode = !isDarkMode;
    await settingsStorage.set(_key, isDarkMode);
  }
}
