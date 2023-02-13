import '../../domain/entities/search_user_entity.dart';

class SearchUserModel extends SearchUserEntity {
  SearchUserModel({
    int? id,
    String? login,
    String? htmlUrl,
    String? avatarUrl,
    bool? siteAdmin,
  }) : super(
          id: id,
          login: login,
          htmlUrl: htmlUrl,
          avatarUrl: avatarUrl,
          siteAdmin: siteAdmin,
        );
  factory SearchUserModel.fromJson(Map<String, dynamic> json) {
    return SearchUserModel(
      id: json['id'] as int?,
      login: json['login'] as String?,
      htmlUrl: json['html_url'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      siteAdmin: json['site_admin'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'login': login,
      'html_url': htmlUrl,
      'avatar_url': avatarUrl,
      'site_admin': siteAdmin,
    };
  }

  factory SearchUserModel.fromMap(Map<String, dynamic> map) {
    return SearchUserModel(
      id: map['id'] as int?,
      login: map['login'] as String?,
      htmlUrl: map['html_url'] as String?,
      avatarUrl: map['avatar_url'] as String?,
      siteAdmin: map['site_admin'] as bool?,
    );
  }
}
