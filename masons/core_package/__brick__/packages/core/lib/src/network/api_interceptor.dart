import 'package:dio/dio.dart';
import 'api_exception.dart';
import '../storage/local_storage.dart';

class ApiInterceptor extends Interceptor {
  ApiInterceptor({this.localStorage});

  final LocalStorage? localStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (localStorage != null) {
      final token = await localStorage!.read(key: 'user_token');
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    final statusCode = response?.statusCode;
    final data = response?.data;

    String message = _mapErrorMessage(statusCode, data);

    final exception = ApiException(
      message: message,
      statusCode: statusCode,
      data: data,
    );

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: exception,
      ),
    );
  }

  String _mapErrorMessage(int? statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return _extractMessage(data) ?? "Bad request";
      case 401:
        return "Unauthorized. Please login again.";
      case 403:
        return "You don't have permission to perform this action.";
      case 404:
        return "Requested resource not found.";
      case 409:
        return _extractMessage(data) ?? "Conflict detected.";
      case 422:
        return _extractMessage(data) ?? "Validation error occurred.";
      case 429:
        return "Too many requests. Please try again later.";
      case 500:
        return "Internal server error. Please try again.";
      case 502:
        return "Bad gateway.";
      case 503:
        return "Service unavailable.";
      case 504:
        return "Gateway timeout.";
      default:
        return "Unexpected error occurred.";
    }
  }

  String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message'] ??
          data['error'] ??
          (data['errors']?.values?.first?.first);
    }
    return null;
  }
}
