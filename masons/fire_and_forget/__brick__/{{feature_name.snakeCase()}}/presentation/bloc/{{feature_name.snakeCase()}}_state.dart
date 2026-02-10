
part of '{{feature_name.snakeCase()}}_cubit.dart';

class {{feature_name.pascalCase()}}State{
  final {{feature_name.pascalCase()}}Status status;
  final String? error;
  final String? message;

const {{feature_name.pascalCase()}}State({
  required this.status,
  this.error,
  this.message,
});

  {{feature_name.pascalCase()}}State copyWith({
{{feature_name.pascalCase()}}Status? status,
  String? error,
  String? message,
}) {
    return {{feature_name.pascalCase()}}State(
      status: status ?? this.status,
      error: error ?? this.error,
      message: message ?? this.message,
);
}
}