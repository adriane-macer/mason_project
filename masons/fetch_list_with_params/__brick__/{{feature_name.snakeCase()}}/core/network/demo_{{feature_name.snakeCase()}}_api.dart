
import '../../{{feature_name.snakeCase()}}_barrel.dart';

class Demo{{feature_name.pascalCase()}}Api  extends {{feature_name.pascalCase()}}Api{
  @override
  Future<List<{{{entity_name.pascalCase()}}}Model>> fetch({{feature_name.pascalCase()}}RequestParams requestParams)async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const {{{entity_name.pascalCase()}}}Model(id: 1),
      const {{{entity_name.pascalCase()}}}Model(id: 2),
      const {{{entity_name.pascalCase()}}}Model(id: 3),
    ];
  }
}