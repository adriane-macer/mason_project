import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

part '{{feature_name.snakeCase()}}_state.dart';

enum {{feature_name.pascalCase()}}Status { initial, loading, success, error }

class {{feature_name.pascalCase()}}Cubit
extends Cubit<{{feature_name.pascalCase()}}State> {
final {{feature_name.pascalCase()}}UseCase useCase;

{{feature_name.pascalCase()}}Cubit(this.useCase)
    : super(const {{feature_name.pascalCase()}}State(status: {{feature_name.pascalCase()}}Status.initial));

Future<void> {{method_name}}() async {
emit(state.copyWith(status: {{feature_name.pascalCase()}}Status.loading));

final result = await useCase();

result.fold(
(failure) => emit(state.copyWith(
status: {{feature_name.pascalCase()}}Status.error,
error: failure.message,
)),
(_) => emit(state.copyWith(status: {{feature_name.pascalCase()}}Status.success)),
);
}
}
