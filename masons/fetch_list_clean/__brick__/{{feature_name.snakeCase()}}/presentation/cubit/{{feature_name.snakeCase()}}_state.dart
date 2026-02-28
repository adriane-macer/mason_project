import 'package:equatable/equatable.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

enum {{feature_name.pascalCase()}}Status {
  initial,
  loading,
  refreshing,
  success,
  failure,
}

class {{feature_name.pascalCase()}}State extends Equatable {
  final {{feature_name.pascalCase()}}Status status;
  final List<{{entity_name.pascalCase()}}>? data;
  final Failure? failure;



  const {{feature_name.pascalCase()}}State({
    required this.status,
    this.data,
    this.failure,
  });

  const {{feature_name.pascalCase()}}State.initial()
    : this(status: {{feature_name.pascalCase()}}Status.initial);

{{feature_name.pascalCase()}}State copyWith({
{{feature_name.pascalCase()}}Status? status,
    List<{{entity_name.pascalCase()}}>? data,
    Failure? failure,
    bool clearFailure = false,
  }) {
    return {{feature_name.pascalCase()}}State(
      status: status ?? this.status,
      data: data ?? this.data,
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => [
    status,
    data,
    failure
  ];
}
