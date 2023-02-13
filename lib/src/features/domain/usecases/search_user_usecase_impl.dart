import 'package:dartz/dartz.dart';

import 'package:test_near/src/core/errors/failure.dart';
import 'package:test_near/src/features/domain/entities/search_user_entity.dart';
import 'package:test_near/src/features/domain/usecases/search_user_usecase.dart';

import '../repositories/search_user_repository.dart';

class SearchUserUsecaseImpl implements SearchUserUsecase {
  final SearchUserRepository _searchUserRepository;
  SearchUserUsecaseImpl({
    required searchUserRepository,
  }) : _searchUserRepository = searchUserRepository;

  @override
  Future<Either<Failure, List<SearchUserEntity>>> call(String searchUserText) {
    return _searchUserRepository(searchUserText);
  }
}
