import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_near/src/features/presenter/pages/cubits/search_user_cubit.dart';

import '../../features/data/datasources/search_user_datasource.dart';
import '../../features/data/datasources/search_user_datasource_impl.dart';
import '../../features/data/repositories/search_user_repository_impl.dart';
import '../../features/domain/repositories/search_user_repository.dart';
import '../../features/domain/usecases/search_user_usecase.dart';
import '../../features/domain/usecases/search_user_usecase_impl.dart';

class AppInjections {
  static final getIt = GetIt.instance;

  static Future<void> injectionsInit() async {
    getIt.registerLazySingleton<SearchUserRepository>(
      () => SearchUserRepositoryImpl(
          searchUserDataSource: getIt<SearchUserDataSource>()),
    );
    getIt.registerLazySingleton<SearchUserUsecase>(() => SearchUserUsecaseImpl(
        searchUserRepository: getIt<SearchUserRepository>()));
    getIt.registerLazySingleton<Dio>(() => Dio());
    getIt.registerLazySingleton<SearchUserDataSource>(
        () => SearchUserDatasourceImpl(dio: getIt<Dio>()));

    getIt.registerLazySingleton<SearchUserCubit>(
        () => SearchUserCubit(searchUserUseCase: getIt<SearchUserUsecase>()));
  }
}
