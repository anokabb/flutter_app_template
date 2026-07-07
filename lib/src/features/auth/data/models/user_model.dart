import 'package:flutter_app_template/src/core/utils/json_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gen/user_model.g.dart';

enum UserRole { super_admin, administrator, employee }

@JsonSerializable()
class UserModel {
  @StringConverter()
  final String? id;
  @StringConverter()
  final String? firstName;
  @StringConverter()
  final String? lastName;
  @StringConverter()
  final String? email;
  @JsonKey(defaultValue: [])
  @ListConverter()
  final List<UserRole> roles;
  @DateTimeConverter()
  final DateTime? createdAt;
  @DateTimeConverter()
  final DateTime? updatedAt;

  const UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.roles = const [],
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
