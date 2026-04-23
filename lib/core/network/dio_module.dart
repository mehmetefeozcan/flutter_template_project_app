import 'package:flutter_template_project_app/core/env/env.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Env.apiBaseUrl,
        receiveTimeout: const Duration(seconds: 35),
        connectTimeout: const Duration(seconds: 35),
        sendTimeout: const Duration(seconds: 35),
        contentType: 'application/json',
      ),
    );

    dio.interceptors.addAll([
      PrettyDioLogger(requestBody: false, responseBody: false),
      // AuthInterceptor(),
    ]);

    return dio;
  }
}
