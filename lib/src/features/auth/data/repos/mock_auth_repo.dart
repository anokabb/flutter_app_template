import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/auth/data/models/login_response.dart';
import 'package:flutter_app_template/src/features/auth/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

import 'auth_repo.dart';

class MockAuthRepo implements AuthRepo {
  @override
  Future<Either<AppError, LoginResponse>> login(String email, String password) async {
    return right(LoginResponse(
      user: UserModel(
        id: '1',
        email: email,
        firstName: 'Test',
        lastName: 'User',
      ),
      token: 'fake-token',
    ));
  }

  @override
  Future<Either<AppError, LoginResponse>> verifyOTP(String email, String otp) async {
    return right(LoginResponse(
      user: UserModel(
        id: '1',
        email: email,
        firstName: 'Test',
        lastName: 'User',
      ),
      token: 'fake-token',
    ));
  }

  @override
  Future<Either<AppError, Unit>> sendEmailLink(String email) async {
    return right(unit);
  }

  @override
  Future<Either<AppError, Unit>> logout() async {
    return right(unit);
  }

  @override
  Future<Either<AppError, Unit>> sendPasswordResetEmail(String email) async {
    return right(unit);
  }

  @override
  Future<Either<AppError, UserModel>> getAuthenticatedUser() async {
    return right(UserModel(
      id: '1',
      email: 'testuser@example.com',
      firstName: 'Test',
      lastName: 'User',
    ));
  }

  @override
  Future<Either<AppError, Unit>> sendPhoneOTP(String countryCode, String phoneNumber) async {
    return right(unit);
  }

  @override
  Future<Either<AppError, LoginResponse>> verifyPhoneOTP(String countryCode, String phoneNumber, String otp) async {
    return right(LoginResponse(
      user: UserModel(
        id: '1',
        email: 'testuser@example.com',
        firstName: 'Test',
        lastName: 'User',
      ),
      token: 'fake-token',
    ));
  }

  @override
  Future<Either<AppError, LoginResponse>> register(String name, String email, String password) async {
    return right(LoginResponse(
      user: UserModel(
        id: '1',
        email: email,
        firstName: name.split(' ').first,
        lastName: name.split(' ').last,
      ),
      token: 'fake-token',
    ));
  }

  @override
  Future<Either<AppError, Unit>> resetPassword(String email, String newPassword) async {
    return right(unit);
  }

  @override
  String? getToken() {
    return 'fake-token';
  }
}
