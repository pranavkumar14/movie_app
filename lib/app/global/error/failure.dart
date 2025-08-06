
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(message);
}

class Error extends Failure {
  const Error({required String message}) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({required String message}) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required String message}) : super(message);
}

class ApiFailure extends Failure {
  const ApiFailure({required String message}) : super(message);
}
