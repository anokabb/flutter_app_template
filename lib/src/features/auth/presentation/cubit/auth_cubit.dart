import 'dart:developer';

import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/features/auth/data/models/user_model.dart';
import 'package:flutter_app_template/src/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'gen/auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(const AuthState.initial());

  bool get isLoggedIn => state is AuthStateAuthenticated;
  UserModel? get user => state is AuthStateAuthenticated ? (state as AuthStateAuthenticated).user : null;

  Future<void> checkAuthStatus() async {
    emit(const AuthState.loading());
    final result = await _authRepo.getAuthenticatedUser();
    log('Auth status check result: $result');

    await result.match(
      (error) {
        log('Error checking auth status: ${error.message}');
        emit(AuthState.unauthenticated());
      },
      (user) async {
        await setUser(user);
      },
    );
  }

  Future<Either<AppError, Unit>> sendEmailLink(String email) async {
    final result = await _authRepo.sendEmailLink(email);
    return result.match(
      (error) {
        log('Error sending email link: ${error.message}');
        emit(AuthState.error(error));
        return left(error);
      },
      (_) {
        emit(const AuthState.linkSent());
        return right(unit);
      },
    );
  }

  Future<void> login(String email, String password) async {
    emit(const AuthState.loading());
    final result = await _authRepo.login(email, password);
    result.match(
      (error) {
        log('Error logging in: ${error.message}');
        emit(AuthState.error(error));
      },
      (response) async {
        await setUser(response.user!);
      },
    );
  }

  Future<void> register(String name, String email, String password) async {
    emit(const AuthState.loading());
    final result = await _authRepo.register(name, email, password);
    result.match(
      (error) {
        log('Error registering: ${error.message}');
        emit(AuthState.error(error));
      },
      (response) async {
        await setUser(response.user!);
      },
    );
  }

  Future<void> requestPasswordReset(String email) async {
    emit(const AuthState.loading());
    final result = await _authRepo.sendPasswordResetEmail(email);
    result.match(
      (error) {
        log('Error requesting password reset: ${error.message}');
        emit(AuthState.error(error));
      },
      (_) {
        emit(const AuthState.otpSent());
      },
    );
  }

  Future<void> verifyOtp(String email, String otp) async {
    emit(const AuthState.loading());
    final result = await _authRepo.verifyOTP(email, otp);
    result.match(
      (error) {
        log('Error verifying OTP: ${error.message}');
        emit(AuthState.error(error));
      },
      (_) {
        emit(const AuthState.otpVerified());
      },
    );
  }

  Future<void> resetPassword(String email, String newPassword) async {
    emit(const AuthState.loading());
    final result = await _authRepo.resetPassword(email, newPassword);
    result.match(
      (error) {
        log('Error resetting password: ${error.message}');
        emit(AuthState.error(error));
      },
      (_) {
        emit(const AuthState.passwordReset());
      },
    );
  }

  void resetEmailLink() {
    emit(const AuthState.initial());
  }

  Future<void> logout() async {
    emit(const AuthState.loading());
    final result = await _authRepo.logout();
    result.match(
      (error) => emit(AuthState.error(error)),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }

  Future<Either<AppError, Unit>> sendPhoneOTP(String countryCode, String phoneNumber) async {
    final result = await _authRepo.sendPhoneOTP(countryCode, phoneNumber);
    return result.match(
      (error) {
        log('Error sending phone OTP: ${error.message}');
        emit(AuthState.error(error));
        return left(error);
      },
      (_) {
        emit(const AuthState.linkSent());
        return right(unit);
      },
    );
  }

  Future<Either<AppError, Unit>> verifyPhoneOTP(
    String countryCode,
    String phoneNumber,
    String otp,
  ) async {
    final result = await _authRepo.verifyPhoneOTP(countryCode, phoneNumber, otp);
    return result.match(
      (error) {
        log('Error verifying phone OTP: ${error.message}');
        emit(AuthState.error(error));
        return left(error);
      },
      (response) {
        setUser(response.user!);
        return right(unit);
      },
    );
  }

  Future setUser(UserModel user) async {
    emit(AuthState.authenticated(user));
    locator.pushNewScope(init: onLoggedIn);
  }
}
