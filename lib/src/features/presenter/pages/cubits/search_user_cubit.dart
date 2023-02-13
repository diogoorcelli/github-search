import 'package:bloc/bloc.dart';
import 'package:test_near/src/core/enums/search_user_status.dart';
import 'package:test_near/src/features/presenter/pages/cubits/search_user_state.dart';

import '../../../domain/usecases/search_user_usecase.dart';

class SearchUserCubit extends Cubit<SearchUserState> {
  final SearchUserUsecase _searchUserUseCase;

  SearchUserCubit({required SearchUserUsecase searchUserUseCase})
      : _searchUserUseCase = searchUserUseCase,
        super(SearchUserState(status: SearchUserStatus.initial));

  Future<void> searchUser(String name) async {
    emit(SearchUserState(status: SearchUserStatus.loading));
    final result = await _searchUserUseCase(name);
    result.fold(
      (failure) => emit(SearchUserState(status: SearchUserStatus.error)),
      (list) => emit(SearchUserState(
          searchUserEntityList: list, status: SearchUserStatus.success)),
    );
  }
}
