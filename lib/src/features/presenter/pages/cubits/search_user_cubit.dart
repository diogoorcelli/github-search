import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:test_near/src/features/presenter/pages/cubits/search_user_state.dart';
import '../../../../core/enums/default_search_status.dart';
import '../../../domain/usecases/search_user_usecase.dart';

class SearchUserCubit extends Cubit<SearchUserState> {
  final SearchUserUsecase _searchUserUseCase;

  SearchUserCubit({required SearchUserUsecase searchUserUseCase})
      : _searchUserUseCase = searchUserUseCase,
        super(SearchUserState(status: DefaultStateStatus.initial));

  Future<void> searchUser(String name) async {
    if (name.isEmpty) {
      emit(SearchUserState(status: DefaultStateStatus.initial));
      return;
    }
    emit(SearchUserState(status: DefaultStateStatus.loading));
    final result = await _searchUserUseCase(name);
    result.fold(
      (failure) => emit(SearchUserState(status: DefaultStateStatus.error)),
      (list) => emit(SearchUserState(
          searchUserEntityList: list, status: DefaultStateStatus.success)),
    );
  }
}
