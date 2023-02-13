// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:test_near/src/core/enums/search_user_status.dart';
import 'package:test_near/src/features/domain/entities/search_user_entity.dart';

class SearchUserState {
  final List<SearchUserEntity> searchUserEntityList;
  final SearchUserStatus status;

  SearchUserState({
    this.searchUserEntityList = const [],
    required this.status,
  });

  SearchUserState copyWith({
    List<SearchUserEntity>? searchUserEntityList,
    SearchUserStatus? status,
  }) {
    return SearchUserState(
      searchUserEntityList: searchUserEntityList ?? this.searchUserEntityList,
      status: status ?? this.status,
    );
  }
}
