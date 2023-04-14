abstract class AppException implements Exception {
  const AppException(this.message);
  final String message;
}

class NetworkException implements AppException {
  @override
  final String message;
  const NetworkException({this.message = 'No internet connection'});
}
