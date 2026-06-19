import '../failure.dart';

sealed class AuthFailure extends Failure {
  const AuthFailure({required super.message});
}

class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure({
    super.message = 'Invalid email or password.',
  });
}

class UserNotFoundFailure extends AuthFailure {
  const UserNotFoundFailure({
    super.message = 'No user found with this email.',
  });
}

class AccountDisabledFailure extends AuthFailure {
  const AccountDisabledFailure({
    super.message = 'This account has been disabled.',
  });
}

class TooManyRequestsFailure extends AuthFailure {
  const TooManyRequestsFailure({
    super.message = 'Too many attempts. Please try again later.',
  });
}

class EmailAlreadyInUseFailure extends AuthFailure {
  const EmailAlreadyInUseFailure({
    super.message = 'The email address is already in use by another account.',
  });
}

class WeakPasswordFailure extends AuthFailure {
  const WeakPasswordFailure({
    super.message = 'The password is too weak.',
  });
}

class OperationNotAllowedFailure extends AuthFailure {
  const OperationNotAllowedFailure({
    super.message = 'This operation is not allowed.',
  });
}
