import 'package:equatable/equatable.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{entity_name.pascalCase()}}Model extends Equatable {
  final int id;

  const {{entity_name.pascalCase()}}Model({
    required this.id,
  });

  factory {{entity_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {

    return {{entity_name.pascalCase()}}Model(
      id: (json['id'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,

    };
  }

{{entity_name.pascalCase()}} toEntity() {
    return {{entity_name.pascalCase()}}(
      id: id,

    );
  }

  @override
  List<Object?> get props => [
    id
  ];
}
