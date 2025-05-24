// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() linkSent,
    required TResult Function(AppError error) error,
    required TResult Function() otpSent,
    required TResult Function() otpVerified,
    required TResult Function() passwordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? linkSent,
    TResult? Function(AppError error)? error,
    TResult? Function()? otpSent,
    TResult? Function()? otpVerified,
    TResult? Function()? passwordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? linkSent,
    TResult Function(AppError error)? error,
    TResult Function()? otpSent,
    TResult Function()? otpVerified,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLinkSent value) linkSent,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateOtpSent value) otpSent,
    required TResult Function(AuthStateOtpVerified value) otpVerified,
    required TResult Function(AuthStatePasswordReset value) passwordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLinkSent value)? linkSent,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateOtpSent value)? otpSent,
    TResult? Function(AuthStateOtpVerified value)? otpVerified,
    TResult? Function(AuthStatePasswordReset value)? passwordReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLinkSent value)? linkSent,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateOtpSent value)? otpSent,
    TResult Function(AuthStateOtpVerified value)? otpVerified,
    TResult Function(AuthStatePasswordReset value)? passwordReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthStateInitialImplCopyWith<$Res> {
  factory _$$AuthStateInitialImplCopyWith(_$AuthStateInitialImpl value,
          $Res Function(_$AuthStateInitialImpl) then) =
      __$$AuthStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateInitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateInitialImpl>
    implements _$$AuthStateInitialImplCopyWith<$Res> {
  __$$AuthStateInitialImplCopyWithImpl(_$AuthStateInitialImpl _value,
      $Res Function(_$AuthStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthStateInitialImpl implements AuthStateInitial {
  const _$AuthStateInitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() linkSent,
    required TResult Function(AppError error) error,
    required TResult Function() otpSent,
    required TResult Function() otpVerified,
    required TResult Function() passwordReset,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? linkSent,
    TResult? Function(AppError error)? error,
    TResult? Function()? otpSent,
    TResult? Function()? otpVerified,
    TResult? Function()? passwordReset,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? linkSent,
    TResult Function(AppError error)? error,
    TResult Function()? otpSent,
    TResult Function()? otpVerified,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLinkSent value) linkSent,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateOtpSent value) otpSent,
    required TResult Function(AuthStateOtpVerified value) otpVerified,
    required TResult Function(AuthStatePasswordReset value) passwordReset,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLinkSent value)? linkSent,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateOtpSent value)? otpSent,
    TResult? Function(AuthStateOtpVerified value)? otpVerified,
    TResult? Function(AuthStatePasswordReset value)? passwordReset,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLinkSent value)? linkSent,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateOtpSent value)? otpSent,
    TResult Function(AuthStateOtpVerified value)? otpVerified,
    TResult Function(AuthStatePasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthStateInitial implements AuthState {
  const factory AuthStateInitial() = _$AuthStateInitialImpl;
}

/// @nodoc
abstract class _$$AuthStateLoadingImplCopyWith<$Res> {
  factory _$$AuthStateLoadingImplCopyWith(_$AuthStateLoadingImpl value,
          $Res Function(_$AuthStateLoadingImpl) then) =
      __$$AuthStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateLoadingImpl>
    implements _$$AuthStateLoadingImplCopyWith<$Res> {
  __$$AuthStateLoadingImplCopyWithImpl(_$AuthStateLoadingImpl _value,
      $Res Function(_$AuthStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthStateLoadingImpl implements AuthStateLoading {
  const _$AuthStateLoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() linkSent,
    required TResult Function(AppError error) error,
    required TResult Function() otpSent,
    required TResult Function() otpVerified,
    required TResult Function() passwordReset,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? linkSent,
    TResult? Function(AppError error)? error,
    TResult? Function()? otpSent,
    TResult? Function()? otpVerified,
    TResult? Function()? passwordReset,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? linkSent,
    TResult Function(AppError error)? error,
    TResult Function()? otpSent,
    TResult Function()? otpVerified,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLinkSent value) linkSent,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateOtpSent value) otpSent,
    required TResult Function(AuthStateOtpVerified value) otpVerified,
    required TResult Function(AuthStatePasswordReset value) passwordReset,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLinkSent value)? linkSent,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateOtpSent value)? otpSent,
    TResult? Function(AuthStateOtpVerified value)? otpVerified,
    TResult? Function(AuthStatePasswordReset value)? passwordReset,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLinkSent value)? linkSent,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateOtpSent value)? otpSent,
    TResult Function(AuthStateOtpVerified value)? otpVerified,
    TResult Function(AuthStatePasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthStateLoading implements AuthState {
  const factory AuthStateLoading() = _$AuthStateLoadingImpl;
}

/// @nodoc
abstract class _$$AuthStateAuthenticatedImplCopyWith<$Res> {
  factory _$$AuthStateAuthenticatedImplCopyWith(
          _$AuthStateAuthenticatedImpl value,
          $Res Function(_$AuthStateAuthenticatedImpl) then) =
      __$$AuthStateAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class __$$AuthStateAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateAuthenticatedImpl>
    implements _$$AuthStateAuthenticatedImplCopyWith<$Res> {
  __$$AuthStateAuthenticatedImplCopyWithImpl(
      _$AuthStateAuthenticatedImpl _value,
      $Res Function(_$AuthStateAuthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthStateAuthenticatedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$AuthStateAuthenticatedImpl implements AuthStateAuthenticated {
  const _$AuthStateAuthenticatedImpl(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthState.authenticated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateAuthenticatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateAuthenticatedImplCopyWith<_$AuthStateAuthenticatedImpl>
      get copyWith => __$$AuthStateAuthenticatedImplCopyWithImpl<
          _$AuthStateAuthenticatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() linkSent,
    required TResult Function(AppError error) error,
    required TResult Function() otpSent,
    required TResult Function() otpVerified,
    required TResult Function() passwordReset,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? linkSent,
    TResult? Function(AppError error)? error,
    TResult? Function()? otpSent,
    TResult? Function()? otpVerified,
    TResult? Function()? passwordReset,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? linkSent,
    TResult Function(AppError error)? error,
    TResult Function()? otpSent,
    TResult Function()? otpVerified,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLinkSent value) linkSent,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateOtpSent value) otpSent,
    required TResult Function(AuthStateOtpVerified value) otpVerified,
    required TResult Function(AuthStatePasswordReset value) passwordReset,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLinkSent value)? linkSent,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateOtpSent value)? otpSent,
    TResult? Function(AuthStateOtpVerified value)? otpVerified,
    TResult? Function(AuthStatePasswordReset value)? passwordReset,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLinkSent value)? linkSent,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateOtpSent value)? otpSent,
    TResult Function(AuthStateOtpVerified value)? otpVerified,
    TResult Function(AuthStatePasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthStateAuthenticated implements AuthState {
  const factory AuthStateAuthenticated(final UserModel user) =
      _$AuthStateAuthenticatedImpl;

  UserModel get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateAuthenticatedImplCopyWith<_$AuthStateAuthenticatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateUnauthenticatedImplCopyWith<$Res> {
  factory _$$AuthStateUnauthenticatedImplCopyWith(
          _$AuthStateUnauthenticatedImpl value,
          $Res Function(_$AuthStateUnauthenticatedImpl) then) =
      __$$AuthStateUnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateUnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateUnauthenticatedImpl>
    implements _$$AuthStateUnauthenticatedImplCopyWith<$Res> {
  __$$AuthStateUnauthenticatedImplCopyWithImpl(
      _$AuthStateUnauthenticatedImpl _value,
      $Res Function(_$AuthStateUnauthenticatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthStateUnauthenticatedImpl implements AuthStateUnauthenticated {
  const _$AuthStateUnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateUnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() linkSent,
    required TResult Function(AppError error) error,
    required TResult Function() otpSent,
    required TResult Function() otpVerified,
    required TResult Function() passwordReset,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? linkSent,
    TResult? Function(AppError error)? error,
    TResult? Function()? otpSent,
    TResult? Function()? otpVerified,
    TResult? Function()? passwordReset,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? linkSent,
    TResult Function(AppError error)? error,
    TResult Function()? otpSent,
    TResult Function()? otpVerified,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLinkSent value) linkSent,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateOtpSent value) otpSent,
    required TResult Function(AuthStateOtpVerified value) otpVerified,
    required TResult Function(AuthStatePasswordReset value) passwordReset,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLinkSent value)? linkSent,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateOtpSent value)? otpSent,
    TResult? Function(AuthStateOtpVerified value)? otpVerified,
    TResult? Function(AuthStatePasswordReset value)? passwordReset,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLinkSent value)? linkSent,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateOtpSent value)? otpSent,
    TResult Function(AuthStateOtpVerified value)? otpVerified,
    TResult Function(AuthStatePasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthStateUnauthenticated implements AuthState {
  const factory AuthStateUnauthenticated() = _$AuthStateUnauthenticatedImpl;
}

/// @nodoc
abstract class _$$AuthStateLinkSentImplCopyWith<$Res> {
  factory _$$AuthStateLinkSentImplCopyWith(_$AuthStateLinkSentImpl value,
          $Res Function(_$AuthStateLinkSentImpl) then) =
      __$$AuthStateLinkSentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateLinkSentImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateLinkSentImpl>
    implements _$$AuthStateLinkSentImplCopyWith<$Res> {
  __$$AuthStateLinkSentImplCopyWithImpl(_$AuthStateLinkSentImpl _value,
      $Res Function(_$AuthStateLinkSentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthStateLinkSentImpl implements AuthStateLinkSent {
  const _$AuthStateLinkSentImpl();

  @override
  String toString() {
    return 'AuthState.linkSent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateLinkSentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() linkSent,
    required TResult Function(AppError error) error,
    required TResult Function() otpSent,
    required TResult Function() otpVerified,
    required TResult Function() passwordReset,
  }) {
    return linkSent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? linkSent,
    TResult? Function(AppError error)? error,
    TResult? Function()? otpSent,
    TResult? Function()? otpVerified,
    TResult? Function()? passwordReset,
  }) {
    return linkSent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? linkSent,
    TResult Function(AppError error)? error,
    TResult Function()? otpSent,
    TResult Function()? otpVerified,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (linkSent != null) {
      return linkSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLinkSent value) linkSent,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateOtpSent value) otpSent,
    required TResult Function(AuthStateOtpVerified value) otpVerified,
    required TResult Function(AuthStatePasswordReset value) passwordReset,
  }) {
    return linkSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLinkSent value)? linkSent,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateOtpSent value)? otpSent,
    TResult? Function(AuthStateOtpVerified value)? otpVerified,
    TResult? Function(AuthStatePasswordReset value)? passwordReset,
  }) {
    return linkSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLinkSent value)? linkSent,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateOtpSent value)? otpSent,
    TResult Function(AuthStateOtpVerified value)? otpVerified,
    TResult Function(AuthStatePasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (linkSent != null) {
      return linkSent(this);
    }
    return orElse();
  }
}

abstract class AuthStateLinkSent implements AuthState {
  const factory AuthStateLinkSent() = _$AuthStateLinkSentImpl;
}

/// @nodoc
abstract class _$$AuthStateErrorImplCopyWith<$Res> {
  factory _$$AuthStateErrorImplCopyWith(_$AuthStateErrorImpl value,
          $Res Function(_$AuthStateErrorImpl) then) =
      __$$AuthStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppError error});

  $AppErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$AuthStateErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateErrorImpl>
    implements _$$AuthStateErrorImplCopyWith<$Res> {
  __$$AuthStateErrorImplCopyWithImpl(
      _$AuthStateErrorImpl _value, $Res Function(_$AuthStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$AuthStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppErrorCopyWith<$Res> get error {
    return $AppErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$AuthStateErrorImpl implements AuthStateError {
  const _$AuthStateErrorImpl(this.error);

  @override
  final AppError error;

  @override
  String toString() {
    return 'AuthState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateErrorImplCopyWith<_$AuthStateErrorImpl> get copyWith =>
      __$$AuthStateErrorImplCopyWithImpl<_$AuthStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() linkSent,
    required TResult Function(AppError error) error,
    required TResult Function() otpSent,
    required TResult Function() otpVerified,
    required TResult Function() passwordReset,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? linkSent,
    TResult? Function(AppError error)? error,
    TResult? Function()? otpSent,
    TResult? Function()? otpVerified,
    TResult? Function()? passwordReset,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? linkSent,
    TResult Function(AppError error)? error,
    TResult Function()? otpSent,
    TResult Function()? otpVerified,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLinkSent value) linkSent,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateOtpSent value) otpSent,
    required TResult Function(AuthStateOtpVerified value) otpVerified,
    required TResult Function(AuthStatePasswordReset value) passwordReset,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLinkSent value)? linkSent,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateOtpSent value)? otpSent,
    TResult? Function(AuthStateOtpVerified value)? otpVerified,
    TResult? Function(AuthStatePasswordReset value)? passwordReset,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLinkSent value)? linkSent,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateOtpSent value)? otpSent,
    TResult Function(AuthStateOtpVerified value)? otpVerified,
    TResult Function(AuthStatePasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthStateError implements AuthState {
  const factory AuthStateError(final AppError error) = _$AuthStateErrorImpl;

  AppError get error;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateErrorImplCopyWith<_$AuthStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateOtpSentImplCopyWith<$Res> {
  factory _$$AuthStateOtpSentImplCopyWith(_$AuthStateOtpSentImpl value,
          $Res Function(_$AuthStateOtpSentImpl) then) =
      __$$AuthStateOtpSentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateOtpSentImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateOtpSentImpl>
    implements _$$AuthStateOtpSentImplCopyWith<$Res> {
  __$$AuthStateOtpSentImplCopyWithImpl(_$AuthStateOtpSentImpl _value,
      $Res Function(_$AuthStateOtpSentImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthStateOtpSentImpl implements AuthStateOtpSent {
  const _$AuthStateOtpSentImpl();

  @override
  String toString() {
    return 'AuthState.otpSent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateOtpSentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() linkSent,
    required TResult Function(AppError error) error,
    required TResult Function() otpSent,
    required TResult Function() otpVerified,
    required TResult Function() passwordReset,
  }) {
    return otpSent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? linkSent,
    TResult? Function(AppError error)? error,
    TResult? Function()? otpSent,
    TResult? Function()? otpVerified,
    TResult? Function()? passwordReset,
  }) {
    return otpSent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? linkSent,
    TResult Function(AppError error)? error,
    TResult Function()? otpSent,
    TResult Function()? otpVerified,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLinkSent value) linkSent,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateOtpSent value) otpSent,
    required TResult Function(AuthStateOtpVerified value) otpVerified,
    required TResult Function(AuthStatePasswordReset value) passwordReset,
  }) {
    return otpSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLinkSent value)? linkSent,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateOtpSent value)? otpSent,
    TResult? Function(AuthStateOtpVerified value)? otpVerified,
    TResult? Function(AuthStatePasswordReset value)? passwordReset,
  }) {
    return otpSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLinkSent value)? linkSent,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateOtpSent value)? otpSent,
    TResult Function(AuthStateOtpVerified value)? otpVerified,
    TResult Function(AuthStatePasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (otpSent != null) {
      return otpSent(this);
    }
    return orElse();
  }
}

abstract class AuthStateOtpSent implements AuthState {
  const factory AuthStateOtpSent() = _$AuthStateOtpSentImpl;
}

/// @nodoc
abstract class _$$AuthStateOtpVerifiedImplCopyWith<$Res> {
  factory _$$AuthStateOtpVerifiedImplCopyWith(_$AuthStateOtpVerifiedImpl value,
          $Res Function(_$AuthStateOtpVerifiedImpl) then) =
      __$$AuthStateOtpVerifiedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateOtpVerifiedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateOtpVerifiedImpl>
    implements _$$AuthStateOtpVerifiedImplCopyWith<$Res> {
  __$$AuthStateOtpVerifiedImplCopyWithImpl(_$AuthStateOtpVerifiedImpl _value,
      $Res Function(_$AuthStateOtpVerifiedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthStateOtpVerifiedImpl implements AuthStateOtpVerified {
  const _$AuthStateOtpVerifiedImpl();

  @override
  String toString() {
    return 'AuthState.otpVerified()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateOtpVerifiedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() linkSent,
    required TResult Function(AppError error) error,
    required TResult Function() otpSent,
    required TResult Function() otpVerified,
    required TResult Function() passwordReset,
  }) {
    return otpVerified();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? linkSent,
    TResult? Function(AppError error)? error,
    TResult? Function()? otpSent,
    TResult? Function()? otpVerified,
    TResult? Function()? passwordReset,
  }) {
    return otpVerified?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? linkSent,
    TResult Function(AppError error)? error,
    TResult Function()? otpSent,
    TResult Function()? otpVerified,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (otpVerified != null) {
      return otpVerified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLinkSent value) linkSent,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateOtpSent value) otpSent,
    required TResult Function(AuthStateOtpVerified value) otpVerified,
    required TResult Function(AuthStatePasswordReset value) passwordReset,
  }) {
    return otpVerified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLinkSent value)? linkSent,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateOtpSent value)? otpSent,
    TResult? Function(AuthStateOtpVerified value)? otpVerified,
    TResult? Function(AuthStatePasswordReset value)? passwordReset,
  }) {
    return otpVerified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLinkSent value)? linkSent,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateOtpSent value)? otpSent,
    TResult Function(AuthStateOtpVerified value)? otpVerified,
    TResult Function(AuthStatePasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (otpVerified != null) {
      return otpVerified(this);
    }
    return orElse();
  }
}

abstract class AuthStateOtpVerified implements AuthState {
  const factory AuthStateOtpVerified() = _$AuthStateOtpVerifiedImpl;
}

/// @nodoc
abstract class _$$AuthStatePasswordResetImplCopyWith<$Res> {
  factory _$$AuthStatePasswordResetImplCopyWith(
          _$AuthStatePasswordResetImpl value,
          $Res Function(_$AuthStatePasswordResetImpl) then) =
      __$$AuthStatePasswordResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStatePasswordResetImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStatePasswordResetImpl>
    implements _$$AuthStatePasswordResetImplCopyWith<$Res> {
  __$$AuthStatePasswordResetImplCopyWithImpl(
      _$AuthStatePasswordResetImpl _value,
      $Res Function(_$AuthStatePasswordResetImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthStatePasswordResetImpl implements AuthStatePasswordReset {
  const _$AuthStatePasswordResetImpl();

  @override
  String toString() {
    return 'AuthState.passwordReset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStatePasswordResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserModel user) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() linkSent,
    required TResult Function(AppError error) error,
    required TResult Function() otpSent,
    required TResult Function() otpVerified,
    required TResult Function() passwordReset,
  }) {
    return passwordReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserModel user)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? linkSent,
    TResult? Function(AppError error)? error,
    TResult? Function()? otpSent,
    TResult? Function()? otpVerified,
    TResult? Function()? passwordReset,
  }) {
    return passwordReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserModel user)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? linkSent,
    TResult Function(AppError error)? error,
    TResult Function()? otpSent,
    TResult Function()? otpVerified,
    TResult Function()? passwordReset,
    required TResult orElse(),
  }) {
    if (passwordReset != null) {
      return passwordReset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateInitial value) initial,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateLinkSent value) linkSent,
    required TResult Function(AuthStateError value) error,
    required TResult Function(AuthStateOtpSent value) otpSent,
    required TResult Function(AuthStateOtpVerified value) otpVerified,
    required TResult Function(AuthStatePasswordReset value) passwordReset,
  }) {
    return passwordReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateInitial value)? initial,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateLinkSent value)? linkSent,
    TResult? Function(AuthStateError value)? error,
    TResult? Function(AuthStateOtpSent value)? otpSent,
    TResult? Function(AuthStateOtpVerified value)? otpVerified,
    TResult? Function(AuthStatePasswordReset value)? passwordReset,
  }) {
    return passwordReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateInitial value)? initial,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateLinkSent value)? linkSent,
    TResult Function(AuthStateError value)? error,
    TResult Function(AuthStateOtpSent value)? otpSent,
    TResult Function(AuthStateOtpVerified value)? otpVerified,
    TResult Function(AuthStatePasswordReset value)? passwordReset,
    required TResult orElse(),
  }) {
    if (passwordReset != null) {
      return passwordReset(this);
    }
    return orElse();
  }
}

abstract class AuthStatePasswordReset implements AuthState {
  const factory AuthStatePasswordReset() = _$AuthStatePasswordResetImpl;
}
