import 'package:news_mobile/core/exception/app_exception.dart';

abstract class AuthException implements AppException {
  @override
  final String message;
  const AuthException(this.message);
}

class UserNotFound extends AuthException {
  UserNotFound(String message) : super(message);
}

class WrongPassWord extends AuthException {
  WrongPassWord(String message) : super(message);
}

class WeakPassword extends AuthException {
  WeakPassword(String message) : super(message);
}

class EmailAlreadyExist extends AuthException {
  EmailAlreadyExist(String message) : super(message);
}

class InvalidEmailAddress extends AuthException {
  InvalidEmailAddress(String message) : super(message);
}

class InvalidCredentials extends AuthException {
  InvalidCredentials(String message) : super(message);
}

class AccountExist extends AuthException {
  AccountExist(String message) : super(message);
}

class SignupFailed extends AuthException {
  SignupFailed(String message) : super(message);
}

class LoginFailed extends AuthException {
  LoginFailed(String message) : super(message);
}

class RequireRecentLogin extends AuthException {
  RequireRecentLogin(String message) : super(message);
}
