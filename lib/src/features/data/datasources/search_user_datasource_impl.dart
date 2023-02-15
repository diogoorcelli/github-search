import 'package:dio/dio.dart';
import 'package:test_near/src/core/endpoints_api/endpoints_api.dart';
import 'package:test_near/src/features/data/datasources/search_user_datasource.dart';

import '../../../core/errors/failures/search_user_failure_impl.dart';
import '../models/search_user_model.dart';

class SearchUserDatasourceImpl implements SearchUserDataSource {
  final Dio _dio;

  SearchUserDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<SearchUserModel>> call(String query) async {
    try {
      final response = await _dio.get(EndpointsApi.baseUrlGithub + query);

      final result = response.data['items'] as List;
      return result.map((e) => SearchUserModel.fromMap(e)).toList();
    } on DioError catch (e) {
      throw SearchUserFailure(message: e.message);
    }
  }
}
