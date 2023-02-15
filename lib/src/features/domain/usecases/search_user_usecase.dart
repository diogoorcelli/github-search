import 'package:dartz/dartz.dart';
import 'package:test_near/src/core/errors/failure.dart';
import 'package:test_near/src/features/domain/entities/search_user_entity.dart';

abstract class SearchUserUsecase {
  Future<Either<Failure, List<SearchUserEntity>>> call(String searchUserText);
}
