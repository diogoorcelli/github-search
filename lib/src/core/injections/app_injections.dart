import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_near/src/features/presenter/pages/cubits/search_user_cubit.dart';

import '../../features/data/datasources/search_user_datasource.dart';
import '../../features/data/datasources/search_user_datasource_impl.dart';
import '../../features/data/repositories/search_user_repository_impl.dart';
import '../../features/domain/repositories/search_user_repository.dart';
import '../../features/domain/usecases/search_user_usecase.dart';
import '../../features/domain/usecases/search_user_usecase_impl.dart';
import '../navigator/navigator_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> injectionsInit() async {
  getIt.registerLazySingleton<SearchUserRepository>(
    () => SearchUserRepositoryImpl(searchUserDataSource: getIt()),
  );
  getIt.registerLazySingleton<SearchUserUsecase>(
    () => SearchUserUsecaseImpl(searchUserRepository: getIt()),
  );
  getIt.registerLazySingleton<NavigatorService>(() => NavigatorService());
  getIt.registerLazySingleton<SearchUserCubit>(
      () => SearchUserCubit(searchUserUseCase: getIt()));
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerLazySingleton<SearchUserDataSource>(
      () => SearchUserDatasourceImpl(dio: getIt()));
  getIt.registerSingleton<SearchUserCubit>(
      SearchUserCubit(searchUserUseCase: getIt()));
}
