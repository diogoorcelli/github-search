import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_near/src/features/data/datasources/search_user_datasource.dart';
import 'package:test_near/src/features/data/models/search_user_model.dart';
import 'package:test_near/src/features/data/repositories/search_user_repository_impl.dart';

class SearchUserDatasourceMock extends Mock implements SearchUserDataSource {}

void main() {
  late SearchUserRepositoryImpl searchUserRepositoryImpl;
  late SearchUserDataSource searchUserDataSource;

  setUp(() {
    searchUserDataSource = SearchUserDatasourceMock();
    searchUserRepositoryImpl =
        SearchUserRepositoryImpl(searchUserDataSource: searchUserDataSource);
  });

  group('search user repository tests:', () {
    test('should return a list of SearchUserModel', () async {
      when(() => searchUserDataSource(any()))
          .thenAnswer((_) async => <SearchUserModel>[]);
      final result = await searchUserRepositoryImpl('test');

      expect(result.isRight(), true);
    });

    test('should return a exception when the call is unsuccessful', () async {
      when(() => searchUserDataSource(any())).thenThrow(Exception());
      final result = await searchUserRepositoryImpl('test');

      expect(result.isLeft(), true);
    });
  });
}
