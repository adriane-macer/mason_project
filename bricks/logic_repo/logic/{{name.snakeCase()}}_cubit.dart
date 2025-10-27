import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../{{name.snakeCase()}}_barrel.dart';

part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
{{name.pascalCase()}}Cubit(this._repository)
      : super({{name.pascalCase()}}Initial());
  final I{{name.pascalCase()}}Repository _repository;

  Future<void> submit({required bool win}) async {
    emit({{name.pascalCase()}}Loading());

    try {
      // TODO implement code
      emit({{name.pascalCase()}}Success());
    } on CustomException catch (e) {
      emit({{name.pascalCase()}}Failed(e));
    } catch (e) {
      emit(
      {{name.pascalCase()}}Failed(CustomException( e.toString())));
    }
  }
}

