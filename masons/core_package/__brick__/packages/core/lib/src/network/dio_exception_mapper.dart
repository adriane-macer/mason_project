import 'package:core_package/core.dart';
import 'package:core_package/src/error/failures/timeout_failure.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

Failure mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return const TimeoutFailure();

    case DioExceptionType.connectionError:
      return const NetworkFailure();

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;

      switch (statusCode) {
        case 401:
        case 403:
          return const UnauthorizedFailure();
        case 404:
        default:
          return const UnknownFailure();
      }

    case DioExceptionType.cancel:
      return const UnknownFailure();

    case DioExceptionType.badCertificate:
      return const NetworkFailure();

    case DioExceptionType.unknown:
      return const UnknownFailure();
  }
}
