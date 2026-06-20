import 'package:core_package/core.dart';
import 'package:dartz/dartz.dart';

import '../../../../domain/repositories/auth_repository.dart';

class SignIn {
  SignIn(this._repository);
  final AuthRepository _repository;

  Future<Result<void>> call({
    required String email,
    required String password,
  }) async {
    try {
      await _repository.signIn(email: email, password: password);
      return const Right(null);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
