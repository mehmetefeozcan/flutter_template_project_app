import 'package:flutter_template_project_app/core/network/result.dart';
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

  @action
  Future<T?> runResult<T>(
    Future<Result<T, ApiException>> Function() request, {
    void Function(ApiException error)? onFailure,
  }) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await request();

      return switch (result) {
        Success<T, ApiException>(:final data) => data,
        Failure<T, ApiException>(:final error) => _handleFailure(
          error,
          onFailure,
        ),
      };
    } finally {
      isLoading = false;
    }
  }

  T? _handleFailure<T>(
    ApiException error,
    void Function(ApiException)? onFailure,
  ) {
    errorMessage = error.message;
    onFailure?.call(error);
    return null;
  }
}
