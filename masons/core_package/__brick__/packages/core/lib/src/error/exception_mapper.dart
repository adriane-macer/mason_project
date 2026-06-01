import 'package:dio/dio.dart';

import 'failure.dart';
import 'failures/network_failure.dart';
import 'failures/server_failure.dart';
import 'failures/unauthorized_failure.dart';
import 'failures/unknown_failure.dart';

class ExceptionMapper {
  static Failure map(Object error) {
    if (error is DioException) {
      switch (error.response?.statusCode) {
        case 401:
          return const UnauthorizedFailure();

        case 500:
          return ServerFailure(
            message: error.message ?? 'Server error',
            code: 500,
          );

        default:
          return ServerFailure(
            message: error.message ?? 'Server error',
            code: error.response?.statusCode,
          );
      }
    }

    return const UnknownFailure();
  }
}