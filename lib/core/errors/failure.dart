import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timedout with the server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timedout with the server');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with the server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request with the server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('There is an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 404:
        return ServerFailure('Page Not Found, Please Try later');
      case 500:
        return ServerFailure(
          'There is a Problem with the server, Please Try later',
        );
      case 400 || 401 || 403:
        return ServerFailure(response['error']['message']);
      default:
        return ServerFailure('There is an Error, Please Try again');
    }
  }
}
