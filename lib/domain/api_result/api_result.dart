import 'package:flutter_bootcamp_task/domain/custom_exceptions/server_error/server_error_exception.dart';

sealed class ApiResult<T> {}

class Success<T> extends ApiResult<T> {
  T data;
  Success({required this.data});
}

class ServerError<T> extends ApiResult<T> {
  ServerErrorException serverErrorException;
  ServerError({required this.serverErrorException});
}

class CodeError<T> extends ApiResult<T> {
  Exception exception;
  CodeError({required this.exception});
}
