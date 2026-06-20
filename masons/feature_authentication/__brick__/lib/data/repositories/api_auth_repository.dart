import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';

class ApiAuthRepository implements AuthRepository {
  @override
  Stream<AuthUser?> get onAuthStateChanged => Stream.value(null);

  @override
  AuthUser? get currentUser => null;

  @override
  Future<void> signIn({required String email, required String password}) async {}

  @override
  Future<void> signOut() async {}

  @override
  Future<void> resetPassword({required String email}) async {}
}
