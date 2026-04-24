// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStore on _BaseStore, Store {
  late final _$isLoadingAtom = Atom(
    name: '_BaseStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_BaseStore.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$runAsyncAction = AsyncAction('_BaseStore.run', context: context);

  @override
  Future<T?> run<T>(Future<T> Function() request) {
    return _$runAsyncAction.run(() => super.run<T>(request));
  }

  late final _$runResultAsyncAction = AsyncAction(
    '_BaseStore.runResult',
    context: context,
  );

  @override
  Future<T?> runResult<T>(
    Future<Result<T, ApiException>> Function() request, {
    void Function(ApiException)? onFailure,
  }) {
    return _$runResultAsyncAction.run(
      () => super.runResult<T>(request, onFailure: onFailure),
    );
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
