import 'package:flutter_app_template/src/core/network/models/app_error.dart';
import 'package:flutter_app_template/src/features/auth/data/models/login_response.dart';
import 'package:flutter_app_template/src/features/auth/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepo {
  Future<Either<AppError, LoginResponse>> login(String email, String password);
  Future<Either<AppError, LoginResponse>> verifyOTP(String email, String otp);
  Future<Either<AppError, Unit>> sendEmailLink(String email);
  Future<Either<AppError, Unit>> logout();
  Future<Either<AppError, Unit>> sendPasswordResetEmail(String email);
  Future<Either<AppError, UserModel>> getAuthenticatedUser();
  Future<Either<AppError, Unit>> sendPhoneOTP(String countryCode, String phoneNumber);
  Future<Either<AppError, LoginResponse>> verifyPhoneOTP(
    String countryCode,
    String phoneNumber,
    String otp,
  );
  Future<Either<AppError, LoginResponse>> register(String name, String email, String password);
  Future<Either<AppError, Unit>> resetPassword(String email, String newPassword);
  String? getToken();
}
