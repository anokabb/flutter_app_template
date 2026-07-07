import 'package:flutter_app_template/src/core/utils/json_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/api_meta_response.freezed.dart';
part 'gen/api_meta_response.g.dart';

@freezed
abstract class ApiMetaResponse with _$ApiMetaResponse {
  const factory ApiMetaResponse({
    @IntConverter() int? perPage,
    @IntConverter() int? currentPage,
    @StringConverter() String? path,
    @IntConverter() int? total,
    @IntConverter() int? lastPage,
  }) = _ApiMetaResponse;

  factory ApiMetaResponse.fromJson(Map<String, dynamic> json) => _$ApiMetaResponseFromJson(json);
}
