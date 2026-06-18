import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

part '{{feature_name.snakeCase()}}_state.dart';

enum {{feature_name.pascalCase()}}Status { initial, loading, success, error }

class {{feature_name.pascalCase()}}Cubit extends Cubit<{{feature_name.pascalCase()}}State> {
  final {{feature_name.pascalCase()}}UseCase useCase;
  Timer? _debounceTimer;

  {{feature_name.pascalCase()}}Cubit(this.useCase)
      : super(const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.initial));

  Future<void> {{method_name.camelCase()}}() async {
    _debounceTimer?.cancel();
    
    emit(state.copyWith(status: {{feature_name.pascalCase()}}Status.loading));
    final params = {{feature_name.pascalCase()}}UseCaseParams();
    
    final result = await useCase(params);
    
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
  }

  void debounced{{method_name.pascalCase()}}({Duration duration = const Duration(milliseconds: 300)}) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(duration, () => {{method_name.camelCase()}}());
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
