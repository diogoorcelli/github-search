import 'package:dartz/dartz.dart';
import 'package:test_near/src/core/errors/failure.dart';

import '../entities/search_user_entity.dart';

abstract class SearchUserRepository {
  Future<Either<Failure, List<SearchUserEntity>>> call(String searchUserText);
}
