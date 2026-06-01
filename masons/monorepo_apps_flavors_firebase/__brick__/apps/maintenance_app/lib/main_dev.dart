import 'package:firebase_auth_impl/firebase_auth_repository.dart';
import 'bootstrap.dart';

void main() async {
  final authRepository = FirebaseAuthRepository();
  await bootstrap(
    authRepository: authRepository,
    env: 'DEV',
  );
}
