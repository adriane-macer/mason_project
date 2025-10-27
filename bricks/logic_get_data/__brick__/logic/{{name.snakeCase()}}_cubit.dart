import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:{{project_name.snakeCase()}}/core/errors/custom_exception.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
{{name.pascalCase()}}Cubit(this._repository)
      : super({{name.pascalCase()}}Initial());
  final I{{repo_name.pascalCase()}}Repository _repository;

  Future<void> {{method_name.camelCase()}}() async {
    emit({{name.pascalCase()}}Loading());

    try {
      final result = await _repository.{{method_name.camelCase()}}();
      emit({{name.pascalCase()}}Success(result));
    } on CustomException catch (e) {
      emit({{name.pascalCase()}}Failed(e));
    } catch (e) {
      emit(
      {{name.pascalCase()}}Failed(CustomException( e.toString())));
    }
  }
}

