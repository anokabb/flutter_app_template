import 'package:json_annotation/json_annotation.dart';

part 'gen/user_model.g.dart';

enum UserRole { super_admin, administrator, employee }

@JsonSerializable()
class UserModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  @JsonKey(defaultValue: [])
  final List<UserRole> roles;
  final DateTime? createdAt;
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
