import 'package:flutter/foundation.dart';
import 'package:news_mobile/core/exception/app_exception.dart';
import 'package:news_mobile/core/exception/auth_exception.dart';
import 'package:news_mobile/core/model/base_error.dart';
import 'package:news_mobile/core/model/base_response.dart';
import 'package:news_mobile/core/model/user.dart';
import 'package:news_mobile/core/utils/cache_helper.dart';
import 'package:news_mobile/data/auth/iauthentication.dart';
import 'package:news_mobile/domain/auth/iauth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthentication _authService;
  AuthRepositoryImpl(this._authService);
  @override
  Future<BaseResponse<User, BaseError>> logInWithEmail(
      {required String email, required String password}) async {
    var response = BaseResponse<User, BaseError>();
    try {
      final result =
          await _authService.logInWithEmail(email: email, password: password);
      response.success = true;
      response.data = result;
      CacheHelper.user = result;
    } on AppException catch (e) {
      response.success = false;
      response.error = BaseError(description: e.message);
    } catch (e) {
      response.success = false;
      debugPrint(e.toString());
      response.error = BaseError(description: 'Something went wrong');
    }
    return response;
  }

  @override
  Future<BaseResponse<void, BaseError>> resetPassword(String email) async {
    var response = BaseResponse<void, BaseError>();
    try {
      final result = await _authService.resetPassword(email);
      response.success = result;
    } on AppException catch (e) {
      response.success = false;
      response.error = BaseError(description: e.message);
    } catch (e) {
      response.success = false;
      debugPrint(e.toString());
      response.error = BaseError(description: 'Something went wrong');
    }
    return response;
  }

  @override
  Future<BaseResponse<void, BaseError>> signOut() async {
    var response = BaseResponse<void, BaseError>();
    try {
      final result = await _authService.signOut();
      response.success = result;
    } on AppException catch (e) {
      response.success = false;
      response.error = BaseError(description: e.message);
    } catch (e) {
      response.success = false;
      debugPrint(e.toString());
      response.error = BaseError(description: 'Something went wrong');
    }
    return response;
  }

  @override
  Future<BaseResponse<User, BaseError>> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    var response = BaseResponse<User, BaseError>();
    try {
      final result = await _authService.signUpWithEmail(
        email: email,
        password: password,
        name: name,
      );
      response.success = true;
      response.data = result;
      CacheHelper.user = result;
    } on AppException catch (e) {
      response.success = false;
      response.error = BaseError(description: e.message);
    } catch (e) {
      response.success = false;
      debugPrint(e.toString());
      response.error = BaseError(description: 'Something went wrong');
    }
    return response;
  }

  @override
  Future<BaseResponse<void, BaseError>> changePassword(
      String newPassword) async {
    var response = BaseResponse<void, BaseError>();
    try {
      final result = await _authService.changePassword(newPassword);
      response.success = result;
    } on AppException catch (e) {
      response.success = false;
      response.error = BaseError(description: e.message);
    } catch (e) {
      response.success = false;
      debugPrint(e.toString());
      response.error = BaseError(description: 'Something went wrong');
    }
    return response;
  }
}
