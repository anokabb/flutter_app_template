part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.authenticated(UserModel user) = AuthStateAuthenticated;
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  const factory AuthState.linkSent() = AuthStateLinkSent;
  const factory AuthState.error(AppError error) = AuthStateError;
  const factory AuthState.otpSent() = AuthStateOtpSent;
  const factory AuthState.otpVerified() = AuthStateOtpVerified;
  const factory AuthState.passwordReset() = AuthStatePasswordReset;
}
