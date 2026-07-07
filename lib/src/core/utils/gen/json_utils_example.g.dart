// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../json_utils_example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExampleModelImpl _$$ExampleModelImplFromJson(Map<String, dynamic> json) =>
    _$ExampleModelImpl(
      id: const IntConverter().fromJson(json['id']),
      name: const StringConverter().fromJson(json['name']),
      description: const StringConverter().fromJson(json['description']),
      price: const DoubleConverter().fromJson(json['price']),
      isActive: const BoolConverter().fromJson(json['is_active']),
      createdAt: const DateTimeConverter().fromJson(json['created_at']),
      updatedAt: const DateTimeConverter().fromJson(json['updated_at']),
      tags: const ListConverter().fromJson(json['tags']),
      categories: const ListConverter().fromJson(json['categories']),
    );

Map<String, dynamic> _$$ExampleModelImplToJson(_$ExampleModelImpl instance) =>
    <String, dynamic>{
      'id': const IntConverter().toJson(instance.id),
      'name': const StringConverter().toJson(instance.name),
      'description': const StringConverter().toJson(instance.description),
      'price': const DoubleConverter().toJson(instance.price),
      'is_active': const BoolConverter().toJson(instance.isActive),
      'created_at': const DateTimeConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeConverter().toJson(instance.updatedAt),
      'tags': const ListConverter().toJson(instance.tags),
      'categories': const ListConverter().toJson(instance.categories),
    };
