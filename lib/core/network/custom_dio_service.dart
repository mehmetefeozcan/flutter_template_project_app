import 'package:flutter_template_project_app/core/network/result.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@injectable
class CustomDioService {
  final Dio dio;

  CustomDioService(this.dio);

  Future<Result<Response, ApiException>> getRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isEncrypted = true,
  }) async {
    try {
      Response response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return Success(response);
    } catch (e) {
      return Failure(_handleError(e));
    }
  }

  Future<Result<Response, ApiException>> postRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isEncrypted = true,
  }) async {
    try {
      Response response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return Success(response);
    } catch (e) {
      return Failure(_handleError(e));
    }
  }

  Future<Result<Response, ApiException>> putRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return Success(response);
    } catch (e) {
      return Failure(_handleError(e));
    }
  }

  Future<Result<Response, ApiException>> patchRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return Success(response);
    } catch (e) {
      return Failure(_handleError(e));
    }
  }

  Future<Result<Response, ApiException>> deleteRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return Success(response);
    } catch (e) {
      return Failure(_handleError(e));
    }
  }

  ApiException _handleError(Object e) {
    if (e is! DioException) {
      return ApiException(e.toString(), type: ApiErrorType.unknown);
    }

    final statusCode = e.response?.statusCode;

    return switch (e.type) {
      DioExceptionType.connectionError ||
      DioExceptionType.connectionTimeout => ApiException(
        'İnternet bağlantısı kurulamadı.',
        type: ApiErrorType.network,
      ),

      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout => ApiException(
        'Sunucu yanıt vermedi, lütfen tekrar deneyin.',
        type: ApiErrorType.timeout,
      ),

      DioExceptionType.badResponse => _handleStatusCode(statusCode, e),

      _ => ApiException(
        e.message ?? 'Beklenmeyen bir hata oluştu.',
        statusCode: statusCode,
        type: ApiErrorType.unknown,
      ),
    };
  }

  ApiException _handleStatusCode(int? statusCode, DioException e) {
    return switch (statusCode) {
      401 => ApiException(
        'Oturum süreniz doldu, lütfen tekrar giriş yapın.',
        statusCode: 401,
        type: ApiErrorType.unauthorized,
      ),
      403 => ApiException(
        'Bu işlem için yetkiniz bulunmuyor.',
        statusCode: 403,
        type: ApiErrorType.forbidden,
      ),
      404 => ApiException(
        'İstenen kaynak bulunamadı.',
        statusCode: 404,
        type: ApiErrorType.notFound,
      ),
      int s when s >= 500 => ApiException(
        'Sunucu hatası, lütfen daha sonra tekrar deneyin.',
        statusCode: s,
        type: ApiErrorType.server,
      ),
      _ => ApiException(
        e.message ?? 'Beklenmeyen bir hata oluştu.',
        statusCode: statusCode,
        type: ApiErrorType.unknown,
      ),
    };
  }
}
