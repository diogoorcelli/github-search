import 'package:test_near/src/features/data/models/search_user_model.dart';

abstract class SearchUserDataSource {
  Future<List<SearchUserModel>> call(String query);
}
