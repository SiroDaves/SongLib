part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState._({
    @Default(AuthStatus.quest) AuthStatus status,
    @Default(User.empty) User user,
  }) = _AuthState;

}

extension XAuthState on AuthState {
  static AuthState unknown() => AuthState._();
  static AuthState authenticated(User user) => AuthState._(
        status: AuthStatus.authenticated,
        user: user,
      );
  static AuthState unauthenticated() => AuthState._(
        status: AuthStatus.unauthenticated,
      );
}
