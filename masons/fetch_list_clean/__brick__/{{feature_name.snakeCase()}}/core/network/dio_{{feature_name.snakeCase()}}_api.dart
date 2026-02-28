import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../{{feature_name.snakeCase()}}_barrel.dart';




class DioGetProductsApi  extends GetProductsApi{
  final Dio dio;

  DioGetProductsApi(this.dio);

  @override
  Future<List<ProductModel>> fetch() async{
    try {
      final response = await dio.get('');
      List<ProductModel> list = [];
      list = (response.data["data"] as List)
          .map((data) => ProductModel.fromJson(data as Map<String, dynamic>))
          .toList();
      return list;
    } catch (e) {
      debugPrint("DioGetProductsApi.fetch : $e");
      rethrow;
    }
  }
}