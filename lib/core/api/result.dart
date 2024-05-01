import '../error/error_handler.dart';

class Result<T> {
  Result.success(this._value) : _error = Failures(ResponseCode.success, ResponseMessage.success);

  Result.failure(this._error) : _value = null;

  final T? _value;
  final Failures _error;

  bool get isSuccess => _value != null;

  bool get isFailure => _error.message.isNotEmpty;

  T? get value => _value;

  Failures get error => _error;
}
