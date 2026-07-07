// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../json_utils_example.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExampleModel _$ExampleModelFromJson(Map<String, dynamic> json) {
  return _ExampleModel.fromJson(json);
}

/// @nodoc
mixin _$ExampleModel {
  @IntConverter()
  int? get id => throw _privateConstructorUsedError;
  @StringConverter()
  String? get name => throw _privateConstructorUsedError;
  @StringConverter()
  String? get description => throw _privateConstructorUsedError;
  @DoubleConverter()
  double? get price => throw _privateConstructorUsedError;
  @BoolConverter()
  bool? get isActive => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @ListConverter()
  List<dynamic>? get tags => throw _privateConstructorUsedError;
  @ListConverter()
  List<dynamic>? get categories => throw _privateConstructorUsedError;

  /// Serializes this ExampleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExampleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExampleModelCopyWith<ExampleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExampleModelCopyWith<$Res> {
  factory $ExampleModelCopyWith(
          ExampleModel value, $Res Function(ExampleModel) then) =
      _$ExampleModelCopyWithImpl<$Res, ExampleModel>;
  @useResult
  $Res call(
      {@IntConverter() int? id,
      @StringConverter() String? name,
      @StringConverter() String? description,
      @DoubleConverter() double? price,
      @BoolConverter() bool? isActive,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt,
      @ListConverter() List<dynamic>? tags,
      @ListConverter() List<dynamic>? categories});
}

/// @nodoc
class _$ExampleModelCopyWithImpl<$Res, $Val extends ExampleModel>
    implements $ExampleModelCopyWith<$Res> {
  _$ExampleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExampleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? tags = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExampleModelImplCopyWith<$Res>
    implements $ExampleModelCopyWith<$Res> {
  factory _$$ExampleModelImplCopyWith(
          _$ExampleModelImpl value, $Res Function(_$ExampleModelImpl) then) =
      __$$ExampleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@IntConverter() int? id,
      @StringConverter() String? name,
      @StringConverter() String? description,
      @DoubleConverter() double? price,
      @BoolConverter() bool? isActive,
      @DateTimeConverter() DateTime? createdAt,
      @DateTimeConverter() DateTime? updatedAt,
      @ListConverter() List<dynamic>? tags,
      @ListConverter() List<dynamic>? categories});
}

/// @nodoc
class __$$ExampleModelImplCopyWithImpl<$Res>
    extends _$ExampleModelCopyWithImpl<$Res, _$ExampleModelImpl>
    implements _$$ExampleModelImplCopyWith<$Res> {
  __$$ExampleModelImplCopyWithImpl(
      _$ExampleModelImpl _value, $Res Function(_$ExampleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExampleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? tags = freezed,
    Object? categories = freezed,
  }) {
    return _then(_$ExampleModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExampleModelImpl implements _ExampleModel {
  const _$ExampleModelImpl(
      {@IntConverter() this.id,
      @StringConverter() this.name,
      @StringConverter() this.description,
      @DoubleConverter() this.price,
      @BoolConverter() this.isActive,
      @DateTimeConverter() this.createdAt,
      @DateTimeConverter() this.updatedAt,
      @ListConverter() final List<dynamic>? tags,
      @ListConverter() final List<dynamic>? categories})
      : _tags = tags,
        _categories = categories;

  factory _$ExampleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExampleModelImplFromJson(json);

  @override
  @IntConverter()
  final int? id;
  @override
  @StringConverter()
  final String? name;
  @override
  @StringConverter()
  final String? description;
  @override
  @DoubleConverter()
  final double? price;
  @override
  @BoolConverter()
  final bool? isActive;
  @override
  @DateTimeConverter()
  final DateTime? createdAt;
  @override
  @DateTimeConverter()
  final DateTime? updatedAt;
  final List<dynamic>? _tags;
  @override
  @ListConverter()
  List<dynamic>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _categories;
  @override
  @ListConverter()
  List<dynamic>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ExampleModel(id: $id, name: $name, description: $description, price: $price, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, tags: $tags, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExampleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      price,
      isActive,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_categories));

  /// Create a copy of ExampleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExampleModelImplCopyWith<_$ExampleModelImpl> get copyWith =>
      __$$ExampleModelImplCopyWithImpl<_$ExampleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExampleModelImplToJson(
      this,
    );
  }
}

abstract class _ExampleModel implements ExampleModel {
  const factory _ExampleModel(
      {@IntConverter() final int? id,
      @StringConverter() final String? name,
      @StringConverter() final String? description,
      @DoubleConverter() final double? price,
      @BoolConverter() final bool? isActive,
      @DateTimeConverter() final DateTime? createdAt,
      @DateTimeConverter() final DateTime? updatedAt,
      @ListConverter() final List<dynamic>? tags,
      @ListConverter() final List<dynamic>? categories}) = _$ExampleModelImpl;

  factory _ExampleModel.fromJson(Map<String, dynamic> json) =
      _$ExampleModelImpl.fromJson;

  @override
  @IntConverter()
  int? get id;
  @override
  @StringConverter()
  String? get name;
  @override
  @StringConverter()
  String? get description;
  @override
  @DoubleConverter()
  double? get price;
  @override
  @BoolConverter()
  bool? get isActive;
  @override
  @DateTimeConverter()
  DateTime? get createdAt;
  @override
  @DateTimeConverter()
  DateTime? get updatedAt;
  @override
  @ListConverter()
  List<dynamic>? get tags;
  @override
  @ListConverter()
  List<dynamic>? get categories;

  /// Create a copy of ExampleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExampleModelImplCopyWith<_$ExampleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
