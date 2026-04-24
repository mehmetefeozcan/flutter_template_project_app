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
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/service/home_service.dart' as _i638;
import '../../features/home/store/home_store.dart' as _i842;
import '../../features/splash/store/splash_store.dart' as _i144;
import '../network/custom_dio_service.dart' as _i587;
import '../network/dio_module.dart' as _i614;
import '../state/language_store.dart' as _i1072;
import '../state/theme_store.dart' as _i185;
import '../storage/hive_service.dart' as _i459;
import '../theme/app_theme.dart' as _i1025;
import 'storage_module.dart' as _i371;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final storageModule = _$StorageModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i979.Box<dynamic>>(
      () => storageModule.settingsBox(),
      preResolve: true,
    );
    gh.factory<_i144.SplashStore>(() => _i144.SplashStore());
    gh.singleton<_i1025.AppTheme>(() => _i1025.AppTheme());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio());
    gh.factory<_i587.CustomDioService>(
      () => _i587.CustomDioService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i459.HiveService>(
      () => storageModule.settingsStorage(gh<_i979.Box<dynamic>>()),
    );
    gh.singleton<_i1072.LanguageStore>(
      () => _i1072.LanguageStore(gh<_i459.HiveService>()),
    );
    gh.singleton<_i185.ThemeStore>(
      () => _i185.ThemeStore(gh<_i459.HiveService>()),
    );
    gh.lazySingleton<_i638.HomeService>(
      () => _i638.HomeService(gh<_i587.CustomDioService>()),
    );
    gh.factory<_i842.HomeStore>(() => _i842.HomeStore(gh<_i638.HomeService>()));
    return this;
  }
}

class _$StorageModule extends _i371.StorageModule {}

class _$DioModule extends _i614.DioModule {}
