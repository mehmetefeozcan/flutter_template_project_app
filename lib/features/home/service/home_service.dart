import 'package:flutter_template_project_app/features/home/model/user_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@lazySingleton
class HomeService {
  final Dio _dio;

  HomeService(this._dio);

  Future<List<UserResponseModel>> getUserList() async {
    final response = await _dio.get('/users');

    return (response.data['users'] as List)
        .map((x) => UserResponseModel.fromJson(x))
        .toList();
  }
}
