import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  test('test dio injection', () async {
    final GetIt getIt = GetIt.instance;

    getIt.registerSingleton<Dio>(Dio());

    final dio = getIt<Dio>();

    final response =
        await dio.get('https://api.github.com/search/users?q=Diogo');

    expect(response.statusCode, 200);
  });
}
