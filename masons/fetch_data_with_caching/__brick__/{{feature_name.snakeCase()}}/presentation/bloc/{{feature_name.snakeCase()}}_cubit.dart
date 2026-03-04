import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

part '{{feature_name.snakeCase()}}_state.dart';

enum {{feature_name.pascalCase()}}Status { initial, loading, success, error }

class {{feature_name.pascalCase()}}Cubit extends Cubit<{{feature_name.pascalCase()}}State> {
  final {{feature_name.pascalCase()}}UseCase useCase;
  StreamSubscription<Either<Failure, {{return_type.pascalCase()}}Entity>>? _streamSubscription;
  Timer? _debounceTimer;

  {{feature_name.pascalCase()}}Cubit(this.useCase)
      : super(const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.initial));

  Future<void> {{method_name}}() async {
    _debounceTimer?.cancel();
    await _streamSubscription?.cancel();
    
    emit(state.copyWith(status: {{feature_name.pascalCase()}}Status.loading));
    final params = GetWalletUseCaseParams();
    
    _streamSubscription = useCase(params).listen(
      (result) {
        result.fold(
          (failure) => emit(state.copyWith(
            status: {{feature_name.pascalCase()}}Status.error,
            error: failure.message,
          )),
          (data) => emit(state.copyWith(
            status: {{feature_name.pascalCase()}}Status.success,
            data: data,
          )),
        );
      },
      onError: (error) => emit(state.copyWith(
        status: {{feature_name.pascalCase()}}Status.error,
        error: error.toString(),
      )),
    );
  }

  void debounced{{method_name.pascalCase()}}({Duration duration = const Duration(milliseconds: 300)}) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(duration, () => {{method_name}}());
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    _streamSubscription?.cancel();
    return super.close();
  }
}
