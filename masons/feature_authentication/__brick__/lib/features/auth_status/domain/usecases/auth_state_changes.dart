import '../../../../domain/entities/auth_user.dart';
import '../../../../domain/repositories/auth_repository.dart';

class GetAuthStateChanges {
  GetAuthStateChanges(this._repository);
  final AuthRepository _repository;

  Stream<AuthUser?> call() {
    return _repository.onAuthStateChanged;
  }
}
