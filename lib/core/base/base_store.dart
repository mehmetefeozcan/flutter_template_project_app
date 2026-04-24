import 'package:flutter_template_project_app/core/network/result.dart';
import 'package:mobx/mobx.dart';
import 'package:dio/dio.dart';

part 'base_store.g.dart';

abstract class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  CancelToken _cancelToken = CancelToken();
  CancelToken get cancelToken => _cancelToken;

  void cancelRequests() {
    _cancelToken.cancel();
    _cancelToken = CancelToken();
  }

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

  Future<T?> runResult<T>(
    Future<Result<T, ApiException>> Function() request, {
    void Function(ApiException error)? onFailure,
  }) async {
    runInAction(() {
      isLoading = true;
      errorMessage = null;
    });

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
      runInAction(() => isLoading = false);
    }
  }

  T? _handleFailure<T>(
    ApiException error,
    void Function(ApiException)? onFailure,
  ) {
    if (error.type == ApiErrorType.cancelled) return null;

    runInAction(() => errorMessage = error.message);
    onFailure?.call(error);
    return null;
  }
}
