import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_near/src/features/domain/entities/search_user_entity.dart';
import 'package:test_near/src/core/errors/failures/search_user_failure_impl.dart';
import 'package:test_near/src/features/domain/repositories/search_user_repository.dart';
import 'package:test_near/src/features/domain/usecases/search_user_usecase_impl.dart';

class SearchUserRepositoryMock extends Mock implements SearchUserRepository {}

void main() {
  late SearchUserRepositoryMock repository;
  late SearchUserUsecaseImpl usecase;

  setUp(() {
    repository = SearchUserRepositoryMock();
    usecase = SearchUserUsecaseImpl(searchUserRepository: repository);
  });

  group('Github list users:', () {
    test('should return a list of github users', () async {
      when(() => repository(any())).thenAnswer(
        (_) async => const Right(<SearchUserEntity>[]),
      );
      final result = await usecase('test');
      expect(result, const Right(<SearchUserEntity>[]));
    });

    test('should return a failure when usecase returns a failure', () async {
      when(() => repository(any())).thenAnswer(
        (_) async => Left(SearchUserFailure(message: '')),
      );
      final result = await usecase('test');
      expect(result, isA<Left>());
      expect(result.fold(id, id), isA<SearchUserFailure>());
    });
  });
}
