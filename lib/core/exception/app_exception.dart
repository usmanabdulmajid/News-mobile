abstract class AppException implements Exception {
  const AppException(this.message);
  final String message;
}

class AuthException extends AppException {
  AuthException(String message) : super(message);
}
