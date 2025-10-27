import '../../{{name.snakeCase()}}_barrel.dart';

import 'package:{{project_name.snakeCase()}}/core/barrels/remote_repository_barrel.dart';

class {{name.pascalCase()}}FakeRepository extends I{{name.pascalCase()}}Repository {
  Future<{{return_class.snakeCase()}}> {{method_name.snakeCase()}}()(){
    await Future.delayed(const Duration(milliseconds: 1500));
    try {
      final response =
      await rootBundle.loadString(); //TODO add asset file
      final decoded = jsonDecode(response) as Map<String, dynamic>;
      return {{return_class.pascalCase()}}.fromJson(decoded['data']);
    } on DioException catch (e) {
      throw DioExceptionHelper.getException(e);
    }  catch (e) {
      debugPrint("{{return_class.pascalCase()}}.{{method_name.camelCase()}}: $e");
      rethrow;
    }
  }

}
}