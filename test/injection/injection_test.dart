import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:test_near/src/core/injections/app_injections.dart';
import 'package:test_near/src/features/data/datasources/search_user_datasource.dart';
import 'package:test_near/src/features/data/datasources/search_user_datasource_impl.dart';
import 'package:test_near/src/features/data/repositories/search_user_repository_impl.dart';
import 'package:test_near/src/features/domain/repositories/search_user_repository.dart';
import 'package:test_near/src/features/domain/usecases/search_user_usecase.dart';
import 'package:test_near/src/features/domain/usecases/search_user_usecase_impl.dart';

void main() {
  GetIt getIt = GetIt.instance;

  setUp(() {
    getIt.registerLazySingleton(
        () => SearchUserUsecaseImpl(searchUserRepository: getIt()));
    getIt.registerLazySingleton(() => SearchUserDatasourceImpl(dio: getIt()));
    getIt.registerLazySingleton(() => SearchUserRepositoryImpl(
        searchUserDataSource: getIt<SearchUserDataSource>()));
  });

  test('test injection usecase', () {
    AppInjections.injectionsInit();

    expect(getIt.isRegistered<SearchUserUsecase>(), true);
    expect(getIt.isRegistered<SearchUserDataSource>(), true);
    expect(getIt.isRegistered<SearchUserRepository>(), true);
  });
}
