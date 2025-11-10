import 'dart:convert';

import 'package:flutter/services.dart';

import '../../{{name.snakeCase()}}_barrel.dart';

import 'package:{{project_name.snakeCase()}}/core/barrels/remote_repository_barrel.dart';

class {{name.pascalCase()}}FakeRepository extends I{{name.pascalCase()}}Repository {
  @override
  Future<(List<{{return_class.pascalCase()}}Model>,String?)> {{method_name.camelCase()}}({required String? cursor, int? limit}) async{
    await Future.delayed(const Duration(milliseconds: 1500));
    try {
      final response =
      await rootBundle.loadString(); //TODO add asset file
      final decoded = jsonDecode(response)['data'] as List;
      final list = (decoded).map((data) => {{return_class.pascalCase()}}Model.fromJson(data)).toList();
      return (list, 'fake');
    } on DioException catch (e) {
      throw DioExceptionHelper.getException(e);
    }  catch (e) {
      debugPrint("{{return_class.pascalCase()}}.{{method_name.camelCase()}}: $e");
      rethrow;
    }
  }

}
