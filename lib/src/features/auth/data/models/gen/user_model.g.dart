// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: const StringConverter().fromJson(json['id']),
      firstName: const StringConverter().fromJson(json['first_name']),
      lastName: const StringConverter().fromJson(json['last_name']),
      email: const StringConverter().fromJson(json['email']),
      roles: (json['roles'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$UserRoleEnumMap, e))
              .toList() ??
          [],
      createdAt: const DateTimeConverter().fromJson(json['created_at']),
      updatedAt: const DateTimeConverter().fromJson(json['updated_at']),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': const StringConverter().toJson(instance.id),
      'first_name': const StringConverter().toJson(instance.firstName),
      'last_name': const StringConverter().toJson(instance.lastName),
      'email': const StringConverter().toJson(instance.email),
      'roles': instance.roles.map((e) => _$UserRoleEnumMap[e]!).toList(),
      'created_at': const DateTimeConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeConverter().toJson(instance.updatedAt),
    };

const _$UserRoleEnumMap = {
  UserRole.super_admin: 'super_admin',
  UserRole.administrator: 'administrator',
  UserRole.employee: 'employee',
};
