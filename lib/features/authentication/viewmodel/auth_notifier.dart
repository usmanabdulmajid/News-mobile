import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_mobile/domain/auth/iauth_repository.dart';
import 'package:news_mobile/features/authentication/viewmodel/auth_state.dart';
import 'package:news_mobile/injection_container.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier(
          locator<IAuthRepository>(),
        ));

class AuthNotifier extends StateNotifier<AuthState> {
  final IAuthRepository _authRepository;
  AuthNotifier(this._authRepository) : super(AuthState.initial());

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await _authRepository.signUpWithEmail(
        email: email, password: password, name: name);
    if (result.success) {
      final user = result.data;
      state = AuthState.success(user!);
    } else {
      state =
          AuthState.failed(result.error?.description ?? 'Something went wrong');
    }
  }

  Future<void> login({required String email, required String password}) async {
    final result =
        await _authRepository.logInWithEmail(email: email, password: password);
    if (result.success) {
      final user = result.data;
      state = AuthState.success(user!);
    } else {
      state =
          AuthState.failed(result.error?.description ?? 'Something went wrong');
    }
  }
}
