import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/reset_password.dart';
import 'package:equatable/equatable.dart';

enum ForgotPasswordStatus { initial, loading, success, failure }

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.status = ForgotPasswordStatus.initial,
    this.errorMessage,
  });

  final ForgotPasswordStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, errorMessage];
}

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({
    required ResetPassword resetPassword,
  })  : _resetPassword = resetPassword,
        super(const ForgotPasswordState());

  final ResetPassword _resetPassword;

  Future<void> sendResetEmail(String email) async {
    emit(const ForgotPasswordState(status: ForgotPasswordStatus.loading));
    final result = await _resetPassword(email: email);
    result.fold(
      (failure) => emit(ForgotPasswordState(
        status: ForgotPasswordStatus.failure,
        errorMessage: failure.message,
      )),
      (_) => emit(const ForgotPasswordState(status: ForgotPasswordStatus.success)),
    );
  }
}
