import '../../{{feature_name.snakeCase()}}_barrel.dart';

class {{return_type.pascalCase()}}Model extends {{return_type.pascalCase()}}Entity {
  const {{return_type.pascalCase()}}Model();

  factory {{return_type.pascalCase()}}Model.fromJson(Map<String, dynamic> json) {
    return const {{return_type.pascalCase()}}Model();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
