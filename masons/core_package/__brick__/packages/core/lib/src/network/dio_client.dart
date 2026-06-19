import 'package:dio/dio.dart';
import 'api_interceptor.dart';
import '../storage/local_storage.dart';

class DioClient {
  final Dio dio;

  DioClient._(this.dio);

  factory DioClient.create({
    required String baseUrl,
    LocalStorage? localStorage,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(ApiInterceptor(localStorage: localStorage));

    return DioClient._(dio);
  }
}
