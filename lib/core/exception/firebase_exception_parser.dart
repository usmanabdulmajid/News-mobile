import 'package:news_mobile/core/exception/app_exception.dart';
import 'package:news_mobile/core/exception/auth_exception.dart';

void parseFirebaseException(String code) {
  if (code == 'invalid-email') {
    throw InvalidEmailAddress('Invalid email address');
  } else if (code == 'user-not-found') {
    throw UserNotFound(
        'User not found, no user correspond to this email address');
  } else if (code == 'wrong-password') {
    throw WrongPassWord('Invalid password');
  } else if (code == 'network-request-failed') {
    throw const NetworkException();
  } else if (code == 'account-exists-with-different-credential') {
    throw AccountExist('Account exist with different email');
  } else if (code == 'invalid-credential') {
    throw InvalidCredentials('Invalid credential');
  } else if (code == 'wrong-password') {
    throw WrongPassWord('Wrong password');
  } else if (code == 'email-already-in-use') {
    throw EmailAlreadyExist('Email already exist, try another email');
  } else if (code == 'weak-password') {
    throw WeakPassword('Provide a stronger password');
  } else if (code == 'requires-recent-login') {
    throw RequireRecentLogin('please re-login to update password');
  } else {
    throw Exception(code);
  }
}
