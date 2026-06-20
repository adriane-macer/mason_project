import 'package:core_package/core.dart';
import 'package:dartz/dartz.dart';

import '../../../../domain/repositories/auth_repository.dart';

class ResetPassword {
  const ResetPassword(this._repository);

  final AuthRepository _repository;

  Future<Result<void>> call({required String email}) async {
    try {
      await _repository.resetPassword(email: email);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
