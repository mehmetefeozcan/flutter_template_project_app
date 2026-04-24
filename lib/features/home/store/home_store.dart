import 'package:flutter_template_project_app/core/base/base_store.dart';
import 'package:flutter_template_project_app/features/home/model/user_response_model.dart';
import 'package:flutter_template_project_app/features/home/service/home_service.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

@injectable
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore extends BaseStore with Store {
  late final HomeService _homeService;
  _HomeStore(this._homeService);

  @observable
  List<UserResponseModel>? userList = [];

  @action
  Future<void> initApp() async {
    userList = await runResult(_homeService.getUserList);
  }
}
