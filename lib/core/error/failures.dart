import 'package:equatable/equatable.dart';

import 'error_handler.dart';

abstract class Failure extends Equatable {}

class ServerException implements Failure {
  const ServerException([this.message]);

  final String? message;

  @override
  String toString() {
    return '$message';
  }

  @override
  List<Object?> get props => [message];

  @override
  bool? get stringify => throw UnimplementedError();
}

class FetchDataException extends ServerException {
  const FetchDataException([message]) : super('Error During Communication');
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super('Bad Request');
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super('Unauthorized');
}

class NotFoundException extends ServerException {
  const NotFoundException([message]) : super('Requested Info Not Found');
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super('Conflict Occurred');
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message]) : super('Internal Server Error');
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([message]) : super('No Internet Connection');
}

class OperationCanceledException extends ServerException {
  const OperationCanceledException([message]) : super('Operation Canceled');
}

class BadCertificateException extends ServerException {
  const BadCertificateException([message]) : super('Bad SSL/TLS Certificate');
}

class ConnectionErrorException extends ServerException {
  const ConnectionErrorException([message]) : super('Connection Error');
}

class UnexpectedException extends ServerException {
  const UnexpectedException([message]) : super('Unexpected Error');
}

class LocalException implements Exception {}

class LocalFailure extends Failures {
  LocalFailure(super.code, super.message);
}
