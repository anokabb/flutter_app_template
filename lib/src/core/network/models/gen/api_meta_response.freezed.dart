// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../api_meta_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiMetaResponse _$ApiMetaResponseFromJson(Map<String, dynamic> json) {
  return _ApiMetaResponse.fromJson(json);
}

/// @nodoc
mixin _$ApiMetaResponse {
  int? get perPage => throw _privateConstructorUsedError;
  int? get currentPage => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get lastPage => throw _privateConstructorUsedError;

  /// Serializes this ApiMetaResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiMetaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiMetaResponseCopyWith<ApiMetaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiMetaResponseCopyWith<$Res> {
  factory $ApiMetaResponseCopyWith(
          ApiMetaResponse value, $Res Function(ApiMetaResponse) then) =
      _$ApiMetaResponseCopyWithImpl<$Res, ApiMetaResponse>;
  @useResult
  $Res call(
      {int? perPage,
      int? currentPage,
      String? path,
      int? total,
      int? lastPage});
}

/// @nodoc
class _$ApiMetaResponseCopyWithImpl<$Res, $Val extends ApiMetaResponse>
    implements $ApiMetaResponseCopyWith<$Res> {
  _$ApiMetaResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiMetaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perPage = freezed,
    Object? currentPage = freezed,
    Object? path = freezed,
    Object? total = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_value.copyWith(
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiMetaResponseImplCopyWith<$Res>
    implements $ApiMetaResponseCopyWith<$Res> {
  factory _$$ApiMetaResponseImplCopyWith(_$ApiMetaResponseImpl value,
          $Res Function(_$ApiMetaResponseImpl) then) =
      __$$ApiMetaResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? perPage,
      int? currentPage,
      String? path,
      int? total,
      int? lastPage});
}

/// @nodoc
class __$$ApiMetaResponseImplCopyWithImpl<$Res>
    extends _$ApiMetaResponseCopyWithImpl<$Res, _$ApiMetaResponseImpl>
    implements _$$ApiMetaResponseImplCopyWith<$Res> {
  __$$ApiMetaResponseImplCopyWithImpl(
      _$ApiMetaResponseImpl _value, $Res Function(_$ApiMetaResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiMetaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perPage = freezed,
    Object? currentPage = freezed,
    Object? path = freezed,
    Object? total = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(_$ApiMetaResponseImpl(
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiMetaResponseImpl implements _ApiMetaResponse {
  const _$ApiMetaResponseImpl(
      {this.perPage, this.currentPage, this.path, this.total, this.lastPage});

  factory _$ApiMetaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiMetaResponseImplFromJson(json);

  @override
  final int? perPage;
  @override
  final int? currentPage;
  @override
  final String? path;
  @override
  final int? total;
  @override
  final int? lastPage;

  @override
  String toString() {
    return 'ApiMetaResponse(perPage: $perPage, currentPage: $currentPage, path: $path, total: $total, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiMetaResponseImpl &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, perPage, currentPage, path, total, lastPage);

  /// Create a copy of ApiMetaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiMetaResponseImplCopyWith<_$ApiMetaResponseImpl> get copyWith =>
      __$$ApiMetaResponseImplCopyWithImpl<_$ApiMetaResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiMetaResponseImplToJson(
      this,
    );
  }
}

abstract class _ApiMetaResponse implements ApiMetaResponse {
  const factory _ApiMetaResponse(
      {final int? perPage,
      final int? currentPage,
      final String? path,
      final int? total,
      final int? lastPage}) = _$ApiMetaResponseImpl;

  factory _ApiMetaResponse.fromJson(Map<String, dynamic> json) =
      _$ApiMetaResponseImpl.fromJson;

  @override
  int? get perPage;
  @override
  int? get currentPage;
  @override
  String? get path;
  @override
  int? get total;
  @override
  int? get lastPage;

  /// Create a copy of ApiMetaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiMetaResponseImplCopyWith<_$ApiMetaResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
