// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/splash/store/splash_store.dart' as _i144;
import '../network/custom_dio_service.dart' as _i587;
import '../network/dio_module.dart' as _i614;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i144.SplashStore>(() => _i144.SplashStore());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.factory<_i587.CustomDioService>(
      () => _i587.CustomDioService(gh<_i361.Dio>()),
    );
    return this;
  }
}

class _$DioModule extends _i614.DioModule {}
