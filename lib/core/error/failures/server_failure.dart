import 'failures.dart';

class ServerFailure implements Failure {
  const ServerFailure([this.message]);

  final String? message;

  @override
  String toString() {
    return '$message';
  }

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;
}

class FetchDataException extends ServerFailure {
  const FetchDataException([message]) : super('Error During Communication');
}

class BadRequestException extends ServerFailure {
  const BadRequestException([message]) : super('Bad Request');
}

class UnauthorizedException extends ServerFailure {
  const UnauthorizedException([message]) : super('Unauthorized');
}

class NotFoundException extends ServerFailure {
  const NotFoundException([message]) : super('Requested Info Not Found');
}

class ConflictException extends ServerFailure {
  const ConflictException([message]) : super('Conflict Occurred');
}

class InternalServerErrorException extends ServerFailure {
  const InternalServerErrorException([message]) : super('Internal Server Error');
}

class NoInternetConnectionException extends ServerFailure {
  const NoInternetConnectionException([message]) : super('No Internet Connection');
}

class OperationCanceledException extends ServerFailure {
  const OperationCanceledException([message]) : super('Operation Canceled');
}

class BadCertificateException extends ServerFailure {
  const BadCertificateException([message]) : super('Bad SSL/TLS Certificate');
}

class ConnectionErrorException extends ServerFailure {
  const ConnectionErrorException([message]) : super('Connection Error');
}

class UnexpectedException extends ServerFailure {
  const UnexpectedException([message]) : super('Unexpected Error');
}
