import 'package:flutter_template_project_app/core/base/base_store.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

@injectable
class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore extends BaseStore with Store {
  @observable
  bool navigateToHome = false;

  Future<void> initApp() async {
    await Future.delayed(const Duration(milliseconds: 300));

    navigateToHome = true;
  }
}
