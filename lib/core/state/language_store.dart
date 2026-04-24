import 'package:flutter_template_project_app/core/storage/hive_service.dart';

import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'language_store.g.dart';

@singleton
class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  final HiveService settingsStorage;

  _LanguageStore(this.settingsStorage);

  static const _key = 'languageCode';

  @observable
  Locale locale = const Locale('tr');

  @action
  Future<void> loadLanguage() async {
    final saved = settingsStorage.get<String>(_key);
    if (saved != null) {
      locale = Locale(saved);
    }
  }

  @action
  Future<void> setLanguage(Locale newLocale) async {
    locale = newLocale;
    await settingsStorage.set(_key, newLocale.languageCode);
  }
}
