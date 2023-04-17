import 'package:news_mobile/core/model/user.dart';

class AuthState {
  bool success;
  String errorMessage;
  User? user;
  AuthState({
    this.success = false,
    this.errorMessage = '',
    this.user,
  });

  factory AuthState.initial() => AuthState();
  factory AuthState.failed(
    String errorMessage,
  ) =>
      AuthState(errorMessage: errorMessage, user: null, success: false);
  factory AuthState.success(User user) =>
      AuthState(success: true, user: user, errorMessage: '');

  AuthState copyWith({
    bool? success,
    String? errorMessage,
    User? user,
  }) {
    return AuthState(
      success: success ?? this.success,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }

  @override
  String toString() =>
      'AuthState(success: $success, errorMessage: $errorMessage, user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthState &&
        other.success == success &&
        other.errorMessage == errorMessage &&
        other.user == user;
  }

  @override
  int get hashCode => success.hashCode ^ errorMessage.hashCode ^ user.hashCode;
}
