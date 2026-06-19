class UserDetailEntity {
  UserDetailEntity({
    required this.userId,
    this.email,
    this.displayName,
    this.photoUrl,
  });

  final String userId;
  final String? email;
  final String? displayName;
  final String? photoUrl;
}
