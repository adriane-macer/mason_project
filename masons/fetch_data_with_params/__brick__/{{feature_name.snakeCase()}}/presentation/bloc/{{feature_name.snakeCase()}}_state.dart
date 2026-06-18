part of '{{feature_name.snakeCase()}}_cubit.dart';

class {{feature_name.pascalCase()}}State extends Equatable {
  final {{feature_name.pascalCase()}}Status status;
  final String? error;
  final String? message;
  final {{return_type.pascalCase()}}Entity? data;

  const {{feature_name.pascalCase()}}State({
    required this.status,
    this.error,
    this.message,
    this.data,
  });

  {{feature_name.pascalCase()}}State copyWith({
    {{feature_name.pascalCase()}}Status? status,
    String? error,
    String? message,
    {{return_type.pascalCase()}}Entity? data,
  }) {
    return {{feature_name.pascalCase()}}State(
      status: status ?? this.status,
      error: error ?? this.error,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, error, message, data];
}
