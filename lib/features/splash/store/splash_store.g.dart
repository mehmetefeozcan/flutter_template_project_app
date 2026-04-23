// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashStore on _SplashStore, Store {
  late final _$navigateToHomeAtom = Atom(
    name: '_SplashStore.navigateToHome',
    context: context,
  );

  @override
  bool get navigateToHome {
    _$navigateToHomeAtom.reportRead();
    return super.navigateToHome;
  }

  @override
  set navigateToHome(bool value) {
    _$navigateToHomeAtom.reportWrite(value, super.navigateToHome, () {
      super.navigateToHome = value;
    });
  }

  @override
  String toString() {
    return '''
navigateToHome: ${navigateToHome}
    ''';
  }
}
