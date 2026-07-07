// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../api_meta_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiMetaResponseImpl _$$ApiMetaResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiMetaResponseImpl(
      perPage: const IntConverter().fromJson(json['per_page']),
      currentPage: const IntConverter().fromJson(json['current_page']),
      path: const StringConverter().fromJson(json['path']),
      total: const IntConverter().fromJson(json['total']),
      lastPage: const IntConverter().fromJson(json['last_page']),
    );

Map<String, dynamic> _$$ApiMetaResponseImplToJson(
        _$ApiMetaResponseImpl instance) =>
    <String, dynamic>{
      'per_page': const IntConverter().toJson(instance.perPage),
      'current_page': const IntConverter().toJson(instance.currentPage),
      'path': const StringConverter().toJson(instance.path),
      'total': const IntConverter().toJson(instance.total),
      'last_page': const IntConverter().toJson(instance.lastPage),
    };
