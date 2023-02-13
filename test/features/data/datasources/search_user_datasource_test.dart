import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_near/src/core/errors/failures/search_user_failure_impl.dart';
import 'package:test_near/src/features/data/datasources/search_user_datasource.dart';
import 'package:test_near/src/features/data/datasources/search_user_datasource_impl.dart';

import '../../../mocks/list_response_mock.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Dio dio;
  late SearchUserDataSource dataSource;

  setUp(() {
    dio = DioMock();
    dataSource = SearchUserDatasourceImpl(dio: dio);
  });

  group('Datasource tests:', () {
    test('should return a list of SearchUserModel', () async {
      when(() => dio.get(any())).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(path: 'path'),
          data: jsonDecode(ListResponseMock.listResponse),
          statusCode: 200));

      final result = await dataSource('query');

      expect(result, isA<List>());
    });

    test('should throw a SearchUserFailure', () async {
      when(() => dio.get(any())).thenThrow(DioError(
          requestOptions: RequestOptions(path: 'path'),
          response: Response(
              requestOptions: RequestOptions(path: 'path'),
              data: jsonDecode(ListResponseMock.listResponse),
              statusCode: 400)));

      final call = dataSource;

      expect(() => call('query'), throwsA(isA<SearchUserFailure>()));
    });
  });
}
