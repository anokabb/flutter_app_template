// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../app_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode, Exception? cause)
        server,
    required TResult Function(Exception? cause) unknown,
    required TResult Function() unauthorized,
    required TResult Function() network,
    required TResult Function() alreadyExists,
    required TResult Function() notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode, Exception? cause)?
        server,
    TResult? Function(Exception? cause)? unknown,
    TResult? Function()? unauthorized,
    TResult? Function()? network,
    TResult? Function()? alreadyExists,
    TResult? Function()? notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode, Exception? cause)? server,
    TResult Function(Exception? cause)? unknown,
    TResult Function()? unauthorized,
    TResult Function()? network,
    TResult Function()? alreadyExists,
    TResult Function()? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) server,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(NetworkError value) network,
    required TResult Function(AlreadyExistsError value) alreadyExists,
    required TResult Function(NotFoundError value) notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? server,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(NetworkError value)? network,
    TResult? Function(AlreadyExistsError value)? alreadyExists,
    TResult? Function(NotFoundError value)? notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? server,
    TResult Function(UnknownError value)? unknown,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(NetworkError value)? network,
    TResult Function(AlreadyExistsError value)? alreadyExists,
    TResult Function(NotFoundError value)? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorCopyWith<$Res> {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) then) =
      _$AppErrorCopyWithImpl<$Res, AppError>;
}

/// @nodoc
class _$AppErrorCopyWithImpl<$Res, $Val extends AppError>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, int? statusCode, Exception? cause});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? statusCode = freezed,
    Object? cause = freezed,
  }) {
    return _then(_$ServerErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      cause: freezed == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl extends ServerError {
  const _$ServerErrorImpl({required this.message, this.statusCode, this.cause})
      : super._();

  @override
  final String message;
  @override
  final int? statusCode;
  @override
  final Exception? cause;

  @override
  String toString() {
    return 'AppError.server(message: $message, statusCode: $statusCode, cause: $cause)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode, cause);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode, Exception? cause)
        server,
    required TResult Function(Exception? cause) unknown,
    required TResult Function() unauthorized,
    required TResult Function() network,
    required TResult Function() alreadyExists,
    required TResult Function() notFound,
  }) {
    return server(message, statusCode, cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode, Exception? cause)?
        server,
    TResult? Function(Exception? cause)? unknown,
    TResult? Function()? unauthorized,
    TResult? Function()? network,
    TResult? Function()? alreadyExists,
    TResult? Function()? notFound,
  }) {
    return server?.call(message, statusCode, cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode, Exception? cause)? server,
    TResult Function(Exception? cause)? unknown,
    TResult Function()? unauthorized,
    TResult Function()? network,
    TResult Function()? alreadyExists,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message, statusCode, cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) server,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(NetworkError value) network,
    required TResult Function(AlreadyExistsError value) alreadyExists,
    required TResult Function(NotFoundError value) notFound,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? server,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(NetworkError value)? network,
    TResult? Function(AlreadyExistsError value)? alreadyExists,
    TResult? Function(NotFoundError value)? notFound,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? server,
    TResult Function(UnknownError value)? unknown,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(NetworkError value)? network,
    TResult Function(AlreadyExistsError value)? alreadyExists,
    TResult Function(NotFoundError value)? notFound,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerError extends AppError {
  const factory ServerError(
      {required final String message,
      final int? statusCode,
      final Exception? cause}) = _$ServerErrorImpl;
  const ServerError._() : super._();

  String get message;
  int? get statusCode;
  Exception? get cause;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownErrorImplCopyWith<$Res> {
  factory _$$UnknownErrorImplCopyWith(
          _$UnknownErrorImpl value, $Res Function(_$UnknownErrorImpl) then) =
      __$$UnknownErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception? cause});
}

/// @nodoc
class __$$UnknownErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$UnknownErrorImpl>
    implements _$$UnknownErrorImplCopyWith<$Res> {
  __$$UnknownErrorImplCopyWithImpl(
      _$UnknownErrorImpl _value, $Res Function(_$UnknownErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cause = freezed,
  }) {
    return _then(_$UnknownErrorImpl(
      cause: freezed == cause
          ? _value.cause
          : cause // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$UnknownErrorImpl extends UnknownError {
  const _$UnknownErrorImpl({this.cause}) : super._();

  @override
  final Exception? cause;

  @override
  String toString() {
    return 'AppError.unknown(cause: $cause)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownErrorImpl &&
            (identical(other.cause, cause) || other.cause == cause));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cause);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      __$$UnknownErrorImplCopyWithImpl<_$UnknownErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode, Exception? cause)
        server,
    required TResult Function(Exception? cause) unknown,
    required TResult Function() unauthorized,
    required TResult Function() network,
    required TResult Function() alreadyExists,
    required TResult Function() notFound,
  }) {
    return unknown(cause);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode, Exception? cause)?
        server,
    TResult? Function(Exception? cause)? unknown,
    TResult? Function()? unauthorized,
    TResult? Function()? network,
    TResult? Function()? alreadyExists,
    TResult? Function()? notFound,
  }) {
    return unknown?.call(cause);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode, Exception? cause)? server,
    TResult Function(Exception? cause)? unknown,
    TResult Function()? unauthorized,
    TResult Function()? network,
    TResult Function()? alreadyExists,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(cause);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) server,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(NetworkError value) network,
    required TResult Function(AlreadyExistsError value) alreadyExists,
    required TResult Function(NotFoundError value) notFound,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? server,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(NetworkError value)? network,
    TResult? Function(AlreadyExistsError value)? alreadyExists,
    TResult? Function(NotFoundError value)? notFound,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? server,
    TResult Function(UnknownError value)? unknown,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(NetworkError value)? network,
    TResult Function(AlreadyExistsError value)? alreadyExists,
    TResult Function(NotFoundError value)? notFound,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownError extends AppError {
  const factory UnknownError({final Exception? cause}) = _$UnknownErrorImpl;
  const UnknownError._() : super._();

  Exception? get cause;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownErrorImplCopyWith<_$UnknownErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedErrorImplCopyWith<$Res> {
  factory _$$UnauthorizedErrorImplCopyWith(_$UnauthorizedErrorImpl value,
          $Res Function(_$UnauthorizedErrorImpl) then) =
      __$$UnauthorizedErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$UnauthorizedErrorImpl>
    implements _$$UnauthorizedErrorImplCopyWith<$Res> {
  __$$UnauthorizedErrorImplCopyWithImpl(_$UnauthorizedErrorImpl _value,
      $Res Function(_$UnauthorizedErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UnauthorizedErrorImpl extends UnauthorizedError {
  const _$UnauthorizedErrorImpl() : super._();

  @override
  String toString() {
    return 'AppError.unauthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthorizedErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode, Exception? cause)
        server,
    required TResult Function(Exception? cause) unknown,
    required TResult Function() unauthorized,
    required TResult Function() network,
    required TResult Function() alreadyExists,
    required TResult Function() notFound,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode, Exception? cause)?
        server,
    TResult? Function(Exception? cause)? unknown,
    TResult? Function()? unauthorized,
    TResult? Function()? network,
    TResult? Function()? alreadyExists,
    TResult? Function()? notFound,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode, Exception? cause)? server,
    TResult Function(Exception? cause)? unknown,
    TResult Function()? unauthorized,
    TResult Function()? network,
    TResult Function()? alreadyExists,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) server,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(NetworkError value) network,
    required TResult Function(AlreadyExistsError value) alreadyExists,
    required TResult Function(NotFoundError value) notFound,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? server,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(NetworkError value)? network,
    TResult? Function(AlreadyExistsError value)? alreadyExists,
    TResult? Function(NotFoundError value)? notFound,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? server,
    TResult Function(UnknownError value)? unknown,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(NetworkError value)? network,
    TResult Function(AlreadyExistsError value)? alreadyExists,
    TResult Function(NotFoundError value)? notFound,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedError extends AppError {
  const factory UnauthorizedError() = _$UnauthorizedErrorImpl;
  const UnauthorizedError._() : super._();
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NetworkErrorImpl extends NetworkError {
  const _$NetworkErrorImpl() : super._();

  @override
  String toString() {
    return 'AppError.network()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NetworkErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode, Exception? cause)
        server,
    required TResult Function(Exception? cause) unknown,
    required TResult Function() unauthorized,
    required TResult Function() network,
    required TResult Function() alreadyExists,
    required TResult Function() notFound,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode, Exception? cause)?
        server,
    TResult? Function(Exception? cause)? unknown,
    TResult? Function()? unauthorized,
    TResult? Function()? network,
    TResult? Function()? alreadyExists,
    TResult? Function()? notFound,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode, Exception? cause)? server,
    TResult Function(Exception? cause)? unknown,
    TResult Function()? unauthorized,
    TResult Function()? network,
    TResult Function()? alreadyExists,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) server,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(NetworkError value) network,
    required TResult Function(AlreadyExistsError value) alreadyExists,
    required TResult Function(NotFoundError value) notFound,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? server,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(NetworkError value)? network,
    TResult? Function(AlreadyExistsError value)? alreadyExists,
    TResult? Function(NotFoundError value)? notFound,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? server,
    TResult Function(UnknownError value)? unknown,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(NetworkError value)? network,
    TResult Function(AlreadyExistsError value)? alreadyExists,
    TResult Function(NotFoundError value)? notFound,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkError extends AppError {
  const factory NetworkError() = _$NetworkErrorImpl;
  const NetworkError._() : super._();
}

/// @nodoc
abstract class _$$AlreadyExistsErrorImplCopyWith<$Res> {
  factory _$$AlreadyExistsErrorImplCopyWith(_$AlreadyExistsErrorImpl value,
          $Res Function(_$AlreadyExistsErrorImpl) then) =
      __$$AlreadyExistsErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AlreadyExistsErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$AlreadyExistsErrorImpl>
    implements _$$AlreadyExistsErrorImplCopyWith<$Res> {
  __$$AlreadyExistsErrorImplCopyWithImpl(_$AlreadyExistsErrorImpl _value,
      $Res Function(_$AlreadyExistsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AlreadyExistsErrorImpl extends AlreadyExistsError {
  const _$AlreadyExistsErrorImpl() : super._();

  @override
  String toString() {
    return 'AppError.alreadyExists()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AlreadyExistsErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode, Exception? cause)
        server,
    required TResult Function(Exception? cause) unknown,
    required TResult Function() unauthorized,
    required TResult Function() network,
    required TResult Function() alreadyExists,
    required TResult Function() notFound,
  }) {
    return alreadyExists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode, Exception? cause)?
        server,
    TResult? Function(Exception? cause)? unknown,
    TResult? Function()? unauthorized,
    TResult? Function()? network,
    TResult? Function()? alreadyExists,
    TResult? Function()? notFound,
  }) {
    return alreadyExists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode, Exception? cause)? server,
    TResult Function(Exception? cause)? unknown,
    TResult Function()? unauthorized,
    TResult Function()? network,
    TResult Function()? alreadyExists,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (alreadyExists != null) {
      return alreadyExists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) server,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(NetworkError value) network,
    required TResult Function(AlreadyExistsError value) alreadyExists,
    required TResult Function(NotFoundError value) notFound,
  }) {
    return alreadyExists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? server,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(NetworkError value)? network,
    TResult? Function(AlreadyExistsError value)? alreadyExists,
    TResult? Function(NotFoundError value)? notFound,
  }) {
    return alreadyExists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? server,
    TResult Function(UnknownError value)? unknown,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(NetworkError value)? network,
    TResult Function(AlreadyExistsError value)? alreadyExists,
    TResult Function(NotFoundError value)? notFound,
    required TResult orElse(),
  }) {
    if (alreadyExists != null) {
      return alreadyExists(this);
    }
    return orElse();
  }
}

abstract class AlreadyExistsError extends AppError {
  const factory AlreadyExistsError() = _$AlreadyExistsErrorImpl;
  const AlreadyExistsError._() : super._();
}

/// @nodoc
abstract class _$$NotFoundErrorImplCopyWith<$Res> {
  factory _$$NotFoundErrorImplCopyWith(
          _$NotFoundErrorImpl value, $Res Function(_$NotFoundErrorImpl) then) =
      __$$NotFoundErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$NotFoundErrorImpl>
    implements _$$NotFoundErrorImplCopyWith<$Res> {
  __$$NotFoundErrorImplCopyWithImpl(
      _$NotFoundErrorImpl _value, $Res Function(_$NotFoundErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotFoundErrorImpl extends NotFoundError {
  const _$NotFoundErrorImpl() : super._();

  @override
  String toString() {
    return 'AppError.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode, Exception? cause)
        server,
    required TResult Function(Exception? cause) unknown,
    required TResult Function() unauthorized,
    required TResult Function() network,
    required TResult Function() alreadyExists,
    required TResult Function() notFound,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode, Exception? cause)?
        server,
    TResult? Function(Exception? cause)? unknown,
    TResult? Function()? unauthorized,
    TResult? Function()? network,
    TResult? Function()? alreadyExists,
    TResult? Function()? notFound,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode, Exception? cause)? server,
    TResult Function(Exception? cause)? unknown,
    TResult Function()? unauthorized,
    TResult Function()? network,
    TResult Function()? alreadyExists,
    TResult Function()? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) server,
    required TResult Function(UnknownError value) unknown,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(NetworkError value) network,
    required TResult Function(AlreadyExistsError value) alreadyExists,
    required TResult Function(NotFoundError value) notFound,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? server,
    TResult? Function(UnknownError value)? unknown,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(NetworkError value)? network,
    TResult? Function(AlreadyExistsError value)? alreadyExists,
    TResult? Function(NotFoundError value)? notFound,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? server,
    TResult Function(UnknownError value)? unknown,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(NetworkError value)? network,
    TResult Function(AlreadyExistsError value)? alreadyExists,
    TResult Function(NotFoundError value)? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundError extends AppError {
  const factory NotFoundError() = _$NotFoundErrorImpl;
  const NotFoundError._() : super._();
}
