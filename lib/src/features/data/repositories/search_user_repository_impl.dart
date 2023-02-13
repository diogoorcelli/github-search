// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:test_near/src/core/errors/failure.dart';
import 'package:test_near/src/features/data/datasources/search_user_datasource.dart';
import 'package:test_near/src/features/domain/entities/search_user_entity.dart';
import 'package:test_near/src/core/errors/failures/search_user_failure_impl.dart';

import '../../domain/repositories/search_user_repository.dart';

class SearchUserRepositoryImpl implements SearchUserRepository {
  final SearchUserDataSource _searchUserDataSource;

  SearchUserRepositoryImpl({required SearchUserDataSource searchUserDataSource})
      : _searchUserDataSource = searchUserDataSource;

  @override
  Future<Either<Failure, List<SearchUserEntity>>> call(
      String searchUserText) async {
    try {
      final result = await _searchUserDataSource(searchUserText);
      return Right(result);
    } catch (e) {
      return Left(SearchUserFailure(message: e.toString()));
    }
  }
}
