part of '{{name.snakeCase()}}_cubit.dart';

sealed class {{name.pascalCase()}}State extends Equatable {
  const {{name.pascalCase()}}State();
}

final class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {
  @override
  List<Object> get props => [];
}

final class {{name.pascalCase()}}Loading extends {{name.pascalCase()}}State {
  @override
  List<Object> get props => [];
}

final class {{name.pascalCase()}}Success extends {{name.pascalCase()}}State {
    final {{return_class.pascalCase()}} data;

    const {{name.pascalCase()}}Success(this.data);

    @override
    List<Object> get props => [data];
}

final class {{name.pascalCase()}}Failed extends {{name.pascalCase()}}State {
  final CustomException exception;

  const {{name.pascalCase()}}Failed(this.exception);

  @override
  List<Object> get props => [exception];
}