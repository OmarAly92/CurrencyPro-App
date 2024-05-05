import 'package:dio/dio.dart';

class Failures {
  Failures(this.code, this.message);

  int code;
  String message;
}

class ErrorHandler implements Exception {
  late Failures failure;

  ErrorHandler.handle(dynamic error, {int? statusCode}) {
    if (error is DioException) {
      failure = _handleError(error);
    } else if (statusCode != null && statusCode == 429) {
      failure = DataSource.tooManyRequest.getFailure();
    } else if (statusCode != null && statusCode == 400) {
      failure = DataSource.badRequest.getFailure();
    } else if (statusCode != null && statusCode == 401) {
      failure = DataSource.unauthorised.getFailure();
    } else if (statusCode != null && statusCode == 404) {
      failure = DataSource.notFound.getFailure();
    } else if (statusCode != null && statusCode == 500) {
      failure = DataSource.internalServerError.getFailure();
    } else {
      failure = DataSource.kDefault.getFailure();
    }
  }

  Failures _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.connectionTimeout.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return Failures(error.response?.statusCode ?? 0, error.response?.data['message'] ?? '');
        } else {
          return DataSource.kDefault.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.cancel.getFailure();
      default:
        return DataSource.kDefault.getFailure();
    }
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  tooManyRequest,
  notFound,
  internalServerError,
  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  kDefault
}

extension DataSourceExtension on DataSource {
  Failures getFailure() {
    switch (this) {
      case DataSource.noContent:
        return Failures(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badRequest:
        return Failures(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failures(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return Failures(ResponseCode.unauthorised, ResponseMessage.unauthorised);
      case DataSource.notFound:
        return Failures(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failures(ResponseCode.internalServerError, ResponseMessage.internalServerError);
      case DataSource.connectionTimeout:
        return Failures(ResponseCode.connectionTimeout, ResponseMessage.connectionTimeout);
      case DataSource.cancel:
        return Failures(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failures(ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return Failures(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failures(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failures(ResponseCode.noInternetConnection, ResponseMessage.noInternetConnection);
      case DataSource.tooManyRequest:
        return Failures(ResponseCode.tooManyRequest, ResponseMessage.tooManyRequest);
      case DataSource.success:
        return Failures(ResponseCode.success, ResponseMessage.success);
      case DataSource.kDefault:
        return Failures(ResponseCode.kDefault, ResponseMessage.kDefault);
    }
  }
}

class ResponseCode {
  /// success with data

  static const int success = 200;

  /// success with no data (no content)

  static const int noContent = 201;

  /// failure, API rejected request

  static const int badRequest = 400;

  /// failure, user is not authorised

  static const int unauthorised = 401;

  ///  failure, API rejected request

  static const int forbidden = 403;

  /// failure, crash in server side

  static const int internalServerError = 500;

  /// failure, not found

  static const int notFound = 404;

  /// too many request

  static const int tooManyRequest = 429;

  /// local status code
  static const int connectionTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int kDefault = -7;
}

class ResponseMessage {
  static const String success = ErrorStrings.success;
  static const String noContent = ErrorStrings.success;
  static const String badRequest = ErrorStrings.badRequestError;
  static const String unauthorised = ErrorStrings.unauthorizedError;
  static const String forbidden = ErrorStrings.forbiddenError;
  static const String internalServerError = ErrorStrings.internalServerError;
  static const String notFound = ErrorStrings.notFoundError;

  /// local status message
  static const String connectionTimeout = ErrorStrings.timeoutError;
  static const String cancel = ErrorStrings.defaultError;
  static const String receiveTimeout = ErrorStrings.timeoutError;
  static const String sendTimeout = ErrorStrings.timeoutError;
  static const String cacheError = ErrorStrings.cacheError;
  static const String noInternetConnection = ErrorStrings.noInternetError;
  static const String kDefault = ErrorStrings.defaultError;
  static const String tooManyRequest = ErrorStrings.tooManyRequest;
}

class ErrorStrings {
  static const String badRequestError = 'The request was unacceptable, often due to missing a required parameter.';
  static const String noContent = 'No content was returned.';
  static const String forbiddenError = 'Access to the requested resource is forbidden.';
  static const String unauthorizedError = 'Authentication credentials are missing or incorrect.';
  static const String notFoundError = 'The requested resource could not be found.';
  static const String conflictError = 'There was a conflict while processing the request.';
  static const String internalServerError = 'The server encountered an internal error.';
  static const String unknownError = 'An unknown error occurred.';
  static const String timeoutError = 'The request timed out while waiting for a response.';
  static const String defaultError = 'An error occurred while processing the request.';
  static const String cacheError = 'There was an error accessing cached data.';
  static const String noInternetError = 'No internet connection available.';
  static const String tooManyRequest = 'API request limit exceeded. Please try again later.';
  static const String success = 'The operation was successful.';
}
