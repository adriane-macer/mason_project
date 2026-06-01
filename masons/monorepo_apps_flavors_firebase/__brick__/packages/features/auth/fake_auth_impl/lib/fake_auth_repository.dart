import 'dart:async';
import 'package:auth_interface/auth_repository.dart';

class FakeAuthRepository implements AuthRepository {
  final _controller = StreamController<String?>.broadcast();

  @override
  Stream<String?> get onAuthStateChanged => _controller.stream;

  @override
  Future<void> signIn() async {
    await Future.delayed(const Duration(milliseconds: 600));
    _controller.add("mock_monorepo_user_99");
  }

  @override
  Future<void> signOut() async {
    _controller.add(null);
  }
}
