import 'package:dartz/dartz.dart';
import 'package:test_near/src/core/errors/failure.dart';
import 'package:test_near/src/features/domain/entities/search_user_entity.dart';
import 'package:test_near/src/core/errors/failures/search_user_failure_impl.dart';

abstract class SearchUserUsecase {
  Future<Either<Failure, List<SearchUserEntity>>> call(String searchUserText);
}
