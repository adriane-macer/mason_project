import 'package:equatable/equatable.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{entity_name.pascalCase()}} extends Equatable {
  final int id;

  const {{entity_name.pascalCase()}}({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id
  ];
}
