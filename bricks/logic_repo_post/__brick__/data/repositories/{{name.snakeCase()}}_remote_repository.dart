import '../../{{name.snakeCase()}}_barrel.dart';

import 'package:{{project_name.snakeCase()}}/core/barrels/remote_repository_barrel.dart';

class {{name.pascalCase()}}RemoteRepository extends I{{name.pascalCase()}}Repository {

  late Dio _dioClient;

  {{name.pascalCase()}}RemoteRepository() {
    _dioClient = DioClient().instance;
  }

  Future<void> {{method_name.camelCase()}}() async{
    try {
      final token = getIt<TokenStorage>().read();

      if (token.isNotEmpty) {
        if (_dioClient.options.headers.containsKey("AUTHORIZATION")) {
        _dioClient.options.headers["AUTHORIZATION"] = "Bearer $token";
        } else {
          _dioClient.options.headers
              .putIfAbsent("AUTHORIZATION", () => "Bearer $token");
        }
      }else{
        debugPrint("{{return_class.pascalCase()}}.{{method_name.camelCase()}}: Not logged in");
        throw Exception("Not logged in");
      }

      final response = await _dioClient.get(); // TODO add path
    } on DioException catch (e) {
      throw DioExceptionHelper.getException(e);
    }  catch (e) {
      debugPrint("{{return_class.pascalCase()}}.{{method_name.camelCase()}}: $e");
      rethrow;
    }
  }
}