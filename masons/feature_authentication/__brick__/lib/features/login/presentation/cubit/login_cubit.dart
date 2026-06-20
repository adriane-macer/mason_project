import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/sign_in.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState {
  const LoginState({
    this.status = LoginStatus.initial,
    this.errorMessage,
  });

  final LoginStatus status;
  final String? errorMessage;
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required SignIn signIn,
  })  : _signIn = signIn,
        super(const LoginState());

  final SignIn _signIn;

  Future<void> login(String email, String password) async {
    emit(const LoginState(status: LoginStatus.loading));
    final result = await _signIn(email: email, password: password);
    result.fold(
      (failure) => emit(LoginState(
        status: LoginStatus.failure,
        errorMessage: failure.message,
      )),
      (_) => emit(const LoginState(status: LoginStatus.success)),
    );
  }
}
