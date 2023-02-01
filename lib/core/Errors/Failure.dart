import 'package:dio/dio.dart';

abstract class Failure {
  final String errormessage;

  Failure(this.errormessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errormessage);
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioErrorType.response:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected error plz try again later ');
      default:
        return ServerFailure('Opps There was an Error,Plz try again');
    }
  }

  factory ServerFailure.fromResponse(int statuscode, dynamic response) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statuscode == 404) {
      return ServerFailure('Your request not found ,please try again');
    } else if (statuscode == 500) {
      return ServerFailure('Internet Server error,plz try again ');
    } else {
      return ServerFailure('Opps There was an Error,Plz try again');
    }
  }
}
