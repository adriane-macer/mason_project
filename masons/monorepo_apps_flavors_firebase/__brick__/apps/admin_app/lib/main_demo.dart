import 'package:fake_auth_impl/fake_auth_repository.dart';
import 'bootstrap.dart';

void main() async {
  final authRepository = FakeAuthRepository();

  await bootstrap(
    authRepository: authRepository,
    env: 'DEMO',
  );
}
