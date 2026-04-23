import 'package:mobx/mobx.dart';

part 'base_store.g.dart';

abstract class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<T?> run<T>(Future<T> Function() request) async {
    try {
      isLoading = true;
      errorMessage = null;
      return await request();
    } catch (e) {
      errorMessage = e.toString();
      return null;
    } finally {
      isLoading = false;
    }
  }
}
