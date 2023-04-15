import 'package:news_mobile/core/model/base_error.dart';
import 'package:news_mobile/core/model/base_response.dart';
import 'package:news_mobile/core/model/user.dart';

abstract class IAuthRepository {
  Future<BaseResponse<User, BaseError>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  });
  Future<BaseResponse<User, BaseError>> logInWithEmail(
      {required String email, required String password});
  Future<BaseResponse<void, BaseError>> resetPassword(String email);
  Future<BaseResponse<void, BaseError>> signOut();
  Future<BaseResponse<void, BaseError>> changePassword(String newPassword);
}
