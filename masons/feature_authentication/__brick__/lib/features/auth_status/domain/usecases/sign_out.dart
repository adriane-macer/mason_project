import 'package:core_package/core.dart';
import 'package:dartz/dartz.dart';

import '../../../../domain/repositories/auth_repository.dart';

class SignOut {
  SignOut(this._repository);
  final AuthRepository _repository;

  Future<Result<void>> call() async {
    try {
      await _repository.signOut();
      return const Right(null);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
