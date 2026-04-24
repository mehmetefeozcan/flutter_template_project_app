import 'package:flutter_template_project_app/features/home/model/user_response_model.dart';
import 'package:flutter_template_project_app/core/network/custom_dio_service.dart';
import 'package:flutter_template_project_app/core/constants/api_routes.dart';
import 'package:flutter_template_project_app/core/network/result.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class HomeService {
  final CustomDioService _dio;

  HomeService(this._dio);

  Future<Result<List<UserResponseModel>, ApiException>> getUserList() async {
    final result = await _dio.getRequest(ApiRoutes.users.list);

    return switch (result) {
      Success(:final data) => switch (data.data['users']) {
        final List users => Success(
          users
              .map((x) => UserResponseModel.fromJson(x as Map<String, dynamic>))
              .toList(),
        ),
        _ => Failure(
          ApiException('Geçersiz yanıt formatı', type: ApiErrorType.unknown),
        ),
      },
      Failure(:final error) => Failure(error),
    };
  }
}
