enum UserRole { unitOwner, security, maintenance, manager, unknown }

class AuthUser {
  const AuthUser({
    required this.id,
    this.email,
    this.displayName,
    this.token,
    this.role = UserRole.unitOwner,
  });

  final String id;
  final String? email;
  final String? displayName;
  final String? token;
  final UserRole role;

  static const empty = AuthUser(id: '');

  bool get isEmpty => this == AuthUser.empty;

  bool get isNotEmpty => this != AuthUser.empty;
}
