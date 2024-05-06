import 'failures.dart';

class LocalFailure extends Failure {
  LocalFailure([this.message]);

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
