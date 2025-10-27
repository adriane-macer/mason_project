import 'dart:convert';

import 'package:flutter/services.dart';

import '../../{{name.snakeCase()}}_barrel.dart';

import 'package:{{project_name.snakeCase()}}/core/barrels/remote_repository_barrel.dart';

class {{name.pascalCase()}}FakeRepository extends I{{name.pascalCase()}}Repository {
  Future<void> {{method_name.camelCase()}}() async{
    await Future.delayed(const Duration(milliseconds: 1500));
    try {
      Future.delayed(const Duration(milliseconds: 1500));
    } on DioException catch (e) {
      throw DioExceptionHelper.getException(e);
    }  catch (e) {
      debugPrint("{{return_class.pascalCase()}}.{{method_name.camelCase()}}: $e");
      rethrow;
    }
  }

}
