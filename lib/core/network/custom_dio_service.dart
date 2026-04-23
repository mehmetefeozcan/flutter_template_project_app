import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@injectable
class CustomDioService {
  final Dio dio;

  CustomDioService(this.dio);

  Future<Response> getRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isEncrypted = true,
  }) async {
    Response response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    return response;
  }

  Future<Response> postRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isEncrypted = true,
  }) async {
    Response response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    return response;
  }

  Future<Response> putRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response response = await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    return response;
  }

  Future<Response> patchRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response response = await dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    return response;
  }

  Future<Response> deleteRequest(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );

    return response;
  }
}
