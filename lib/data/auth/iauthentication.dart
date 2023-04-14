import 'package:news_mobile/core/model/user.dart';

abstract class IAuthentication {
  Future<User> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  });
  Future<User> logInWithEmail(
      {required String email, required String password});
  Future<bool> resetPassword(String email);
  Future<bool> signOut();
  Future<bool> changePassword(String newPassword);
}
