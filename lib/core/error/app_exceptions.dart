class AppException implements Exception {
  final String message;
  AppException(this.message);
  @override
  String toString() => 'AppException: $message';
}

class NetworkException extends AppException {
  NetworkException(super.message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(super.message);
}

class ServerException extends AppException {
  ServerException(super.message);
}

class ParsingException extends AppException {
  ParsingException(super.message);
}
