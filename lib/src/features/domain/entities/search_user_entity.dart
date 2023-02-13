class SearchUserEntity {
  final int? id;
  final String? login;
  final String? htmlUrl;
  final String? avatarUrl;
  final bool? siteAdmin;

  SearchUserEntity({
    this.id,
    required this.login,
    this.htmlUrl,
    this.avatarUrl,
    this.siteAdmin,
  });

  @override
  bool operator ==(covariant SearchUserEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.login == login &&
        other.htmlUrl == htmlUrl &&
        other.avatarUrl == avatarUrl &&
        other.siteAdmin == siteAdmin;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        login.hashCode ^
        htmlUrl.hashCode ^
        avatarUrl.hashCode ^
        siteAdmin.hashCode;
  }
}
