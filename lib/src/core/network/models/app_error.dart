import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/app_error.freezed.dart';

@Freezed()
sealed class AppError with _$AppError {
  const AppError._(); // allows custom getters

  const factory AppError.server({
    required String message,
    int? statusCode,
    Exception? cause,
  }) = ServerError;

  const factory AppError.unknown({Exception? cause}) = UnknownError;
  const factory AppError.unauthorized() = UnauthorizedError;
  const factory AppError.network() = NetworkError;
  const factory AppError.alreadyExists() = AlreadyExistsError;
  const factory AppError.notFound() = NotFoundError;

  /// Localized message fallback
  String get message {
    if (this is ServerError) {
      return (this as ServerError).message;
    } else if (this is UnknownError) {
      return 'Unknown error';
    } else if (this is UnauthorizedError) {
      return 'Unauthorized';
    } else if (this is NetworkError) {
      return 'Network error';
    } else if (this is AlreadyExistsError) {
      return 'Already exists';
    } else if (this is NotFoundError) {
      return 'Not found';
    } else {
      return 'An error occurred';
    }
  }

  /// Optional error code/tag
  String get code {
    if (this is ServerError) {
      return 'SERVER_ERROR';
    } else if (this is UnauthorizedError) {
      return 'UNAUTHORIZED';
    } else if (this is NetworkError) {
      return 'NETWORK';
    } else if (this is AlreadyExistsError) {
      return 'ALREADY_EXISTS';
    } else if (this is NotFoundError) {
      return 'NOT_FOUND';
    } else if (this is UnknownError) {
      return 'UNKNOWN';
    } else {
      return 'UNKNOWN_ERROR';
    }
  }

  /// UI helper: show error as Snackbar
  void show([BuildContext? ctx]) {
    if (ctx != null) {
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  /// Factory to convert exceptions into AppError
  factory AppError.fromException(Object error) {
    if (error is DioException) {
      final status = error.response?.statusCode;

      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.connectionError) {
        return const AppError.network();
      }

      if (status == 401) return const AppError.unauthorized();
      if (status == 404) return const AppError.notFound();
      if (status == 409) return const AppError.alreadyExists();
      if (status == 500) {
        return AppError.unknown(cause: error);
      }

      return AppError.server(
        message: (error.response?.data is Map && error.response?.data['message'] != null)
            ? error.response?.data['message']
            : 'Server error',
        statusCode: status,
        cause: error,
      );
    }

    return const AppError.unknown();
  }
}
