import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bootcamp_task/domain/custom_exceptions/server_error/server_error_exception.dart';

class ApiErrorMessage {
  static String getErrorMessage({required Exception exception}) {
    switch (exception) {
      case ServerErrorException():
        return "Something Went Wrong 🤔 ${exception.statusCode} ${exception.statusMessage}";
      case SocketException():
        return "No Internet connection 😑";
      case HttpException():
        return "Couldn't find the source 😱";
      case FormatException():
        return "Bad response format 👎";
      case DioException():
        switch (exception.type) {
          case DioExceptionType.connectionTimeout:
            return "Connection timeout with server ⌛";
          case DioExceptionType.sendTimeout:
            return "Send timeout in connection with server ⏱";
          case DioExceptionType.receiveTimeout:
            return "Receive timeout in connection with server ⏰";
          case DioExceptionType.badCertificate:
            return "The certificate provided by the server is not valid 📑";
          case DioExceptionType.badResponse:
            return "Bad response format 👎";
          case DioExceptionType.cancel:
            return "Request to server was cancelled ✖";
          case DioExceptionType.connectionError:
            return "No Internet connection 😑";
          case DioExceptionType.unknown:
            return "Something Went Wrong 🤔";
        }

      default:
        return "Something Went Wrong 🤔";
    }
  }
}
