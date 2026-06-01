abstract class AuthRepository {
  Stream<String?> get onAuthStateChanged;
  Future<void> signIn();
  Future<void> signOut();
}