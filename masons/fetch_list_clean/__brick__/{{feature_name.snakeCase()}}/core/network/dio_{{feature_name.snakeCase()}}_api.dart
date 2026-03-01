import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';




class Dio{{feature_name.pascalCase()}}Api  extends {{feature_name.pascalCase()}}Api{
  final Dio dio;

  Dio{{feature_name.pascalCase()}}Api(this.dio);

  @override
  Future<List<{{entity_name.pascalCase()}}Model>> fetch() async{
    try {
      final response = await dio.get(
        // TODO add path
      );
      final data = response.data['data'] as List?;
      return data
          ?.map((data) => {{entity_name.pascalCase()}}Model.fromJson(data as Map<String, dynamic>))
          .toList() ??
          [];
    } catch (e) {
      debugPrint("Dio{{feature_name.pascalCase()}}Api.fetch : $e");
      rethrow;
    }
  }
}