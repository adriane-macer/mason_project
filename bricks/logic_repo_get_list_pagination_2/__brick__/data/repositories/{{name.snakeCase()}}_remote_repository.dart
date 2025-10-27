import '../../{{name.snakeCase()}}_barrel.dart';

import 'package:{{project_name.snakeCase()}}/core/barrels/remote_repository_barrel.dart';

class {{name.pascalCase()}}RemoteRepository extends I{{name.pascalCase()}}Repository {


  late Dio _dioClient;

  {{name.pascalCase()}}RemoteRepository() {
    _dioClient = DioClient().instance;
  }

  Future<(List<{{return_class.pascalCase()}}>, String?)> {{method_name.camelCase()}}({ int limit = 10, String? cursor}) async{
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

      final json = response.data as Map<String, dynamic>;
      final list = (json["data"] as List)
          .map((data) =>
          {{return_class.pascalCase()}}.fromJson(data as Map<String, dynamic>))
          .toList();
      return list;



      // final response = await _dioClient
      //     .get("  $id?cursor=${cursor ?? ""}");
      // TODO implement request

      final json = response.data as Map<String, dynamic>;
      final mapItems = json["data"]["items"] as List<dynamic>?;

      List<{{return_class.pascalCase()}}> items = [];
      if (mapItems != null) {
        items =
        mapItems.map((element) => {{return_class.pascalCase()}}.fromJson(element)).toList();
      }
      final nextCursor = json["data"]["nextCursor"] as String?;
      return (items, nextCursor);
    } on DioException catch (e) {
      throw DioExceptionHelper.getException(e);
    }  catch (e) {
      debugPrint("{{return_class.pascalCase()}}.{{method_name.camelCase()}}: $e");
      rethrow;
    }
  }
}