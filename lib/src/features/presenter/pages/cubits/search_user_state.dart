import 'package:test_near/src/features/domain/entities/search_user_entity.dart';

import '../../../../core/enums/default_search_status.dart';

class SearchUserState {
  final List<SearchUserEntity> searchUserEntityList;
  final DefaultStateStatus status;

  SearchUserState({
    this.searchUserEntityList = const [],
    required this.status,
  });

  SearchUserState copyWith({
    List<SearchUserEntity>? searchUserEntityList,
    DefaultStateStatus? status,
  }) {
    return SearchUserState(
      searchUserEntityList: searchUserEntityList ?? this.searchUserEntityList,
      status: status ?? this.status,
    );
  }
}
