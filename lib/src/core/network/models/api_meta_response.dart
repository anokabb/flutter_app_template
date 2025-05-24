import 'package:freezed_annotation/freezed_annotation.dart';

part 'gen/api_meta_response.freezed.dart';
part 'gen/api_meta_response.g.dart';

@freezed
abstract class ApiMetaResponse with _$ApiMetaResponse {
  const factory ApiMetaResponse({
    int? perPage,
    int? currentPage,
    String? path,
    int? total,
    int? lastPage,
  }) = _ApiMetaResponse;

  factory ApiMetaResponse.fromJson(Map<String, dynamic> json) => _$ApiMetaResponseFromJson(json);
}
