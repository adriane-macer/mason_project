import 'dart:convert';

import 'package:flutter/services.dart';

import '../../{{name.snakeCase()}}_barrel.dart';

import 'package:{{project_name.snakeCase()}}/core/barrels/remote_repository_barrel.dart';

class {{name.pascalCase()}}FakeRepository extends I{{name.pascalCase()}}Repository {
  Future<(List<{{return_class.pascalCase()}}>, String?)> {{method_name.camelCase()}}({int limit = 10, String? cursor}) async{
    await Future.delayed(const Duration(milliseconds: 1500));
    try {
      final response =
      await rootBundle.loadString(); //TODO add asset file
      final decoded = jsonDecode(response)['data'] as List;
      return (decoded).map((data) => {{return_class.pascalCase()}}.fromJson(data)).toList();
    } on DioException catch (e) {
      throw DioExceptionHelper.getException(e);
    }  catch (e) {
      debugPrint("{{return_class.pascalCase()}}.{{method_name.camelCase()}}: $e");
      rethrow;
    }
  }

}
