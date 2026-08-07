import 'package:dio/dio.dart';
import 'exceptions.dart';
import 'failure.dart';

class ErrorMapper {
  static Failure mapDioExceptionToFailure(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure('Please check your internet connection.');
      case DioExceptionType.badResponse:
        final statusCode = exception.response?.statusCode;
        final data = exception.response?.data;
        String message = 'An unexpected server error occurred.';

        if (data is Map<String, dynamic> && data.containsKey('message')) {
          message = data['message'] as String;
        } else if (data is String) {
          if (data.contains('<html') || data.contains('<!DOCTYPE') || data.length > 200) {
            message = 'A server error occurred (HTML/Raw response). Please try again.';
          } else {
            message = data;
          }
        }

        if (statusCode == 401 || statusCode == 403) {
          return UnauthorizedFailure(message);
        }
        
        return ServerFailure(message, statusCode: statusCode);
      case DioExceptionType.cancel:
        return const ServerFailure('Request was cancelled.');
      case DioExceptionType.unknown:
      case DioExceptionType.badCertificate:
      default:
        if (exception.error is NetworkException) {
          return NetworkFailure((exception.error as NetworkException).message);
        }
        return const ServerFailure('An unknown error occurred.');
    }
  }

  static Failure mapExceptionToFailure(dynamic exception) {
    if (exception is ServerException) {
      return ServerFailure(exception.message, statusCode: exception.statusCode);
    } else if (exception is NetworkException) {
      return NetworkFailure(exception.message);
    } else if (exception is UnauthorizedException) {
      return UnauthorizedFailure(exception.message);
    } else if (exception is DioException) {
      return mapDioExceptionToFailure(exception);
    }
    return ServerFailure('Unexpected error: ${exception.toString()}');
  }
}
