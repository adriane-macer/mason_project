import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth_interface/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final _auth = FirebaseAuth.instance;

  @override
  Stream<String?> get onAuthStateChanged =>
      _auth.authStateChanges().map((user) => user?.uid);

  @override
  Future<void> signIn() => _auth.signInAnonymously();

  @override
  Future<void> signOut() => _auth.signOut();
}
