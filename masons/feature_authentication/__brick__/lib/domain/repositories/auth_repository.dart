import '../entities/auth_user.dart';

abstract interface class AuthRepository {
  Stream<AuthUser?> get onAuthStateChanged;
  AuthUser? get currentUser;
  Future<void> signIn({required String email, required String password});
  Future<void> signOut();
  Future<void> resetPassword({required String email});
}
