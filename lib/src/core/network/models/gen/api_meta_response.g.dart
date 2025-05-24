// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../api_meta_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiMetaResponseImpl _$$ApiMetaResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiMetaResponseImpl(
      perPage: (json['per_page'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      path: json['path'] as String?,
      total: (json['total'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ApiMetaResponseImplToJson(
        _$ApiMetaResponseImpl instance) =>
    <String, dynamic>{
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'path': instance.path,
      'total': instance.total,
      'last_page': instance.lastPage,
    };
