import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioError(DioException dioError) {
    final errorMessage = _getErrorMessage(dioError);

    return ServerFailure(errorMessage: errorMessage);
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    String errorMessage;
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      errorMessage = response['error']?['message'] ?? 'An error occurred';
    } else if (statusCode == 404) {
      errorMessage = "Your response not found, please try later!";
    } else if (statusCode == 500) {
      errorMessage = "Internal server error, please try later";
    } else {
      errorMessage = "Oops, there was an error, please try again";
    }
    return ServerFailure(errorMessage: errorMessage);
  }

  static String _getErrorMessage(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out';
      case DioExceptionType.sendTimeout:
        return 'Send request timed out';
      case DioExceptionType.receiveTimeout:
        return 'Receive response timed out';
      case DioExceptionType.badCertificate:
        return 'Bad certificate received';
      case DioExceptionType.badResponse:
        if (dioError.response != null) {
          return ServerFailure.fromResponse(
            dioError.response!.statusCode,
            dioError.response!.data,
          ).errorMessage;
        } else {
          return 'Received a bad response';
        }
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.connectionError:
        return 'No Internet Connection';
      case DioExceptionType.unknown:
        if (dioError.message?.contains("SocketException") ?? false) {
          return 'No Internet Connection';
        }
        return "Unexpected Error, please try again";
      default:
        return 'Oops, there was an error, please try again';
    }
  }
}
