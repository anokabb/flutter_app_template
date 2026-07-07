import 'package:freezed_annotation/freezed_annotation.dart';

import 'json_utils.dart';

part 'gen/json_utils_example.freezed.dart';
part 'gen/json_utils_example.g.dart';

/// Example model demonstrating how to use all custom JSON converters
/// This shows how to handle backend data type inconsistencies
@freezed
class ExampleModel with _$ExampleModel {
  const factory ExampleModel({
    @IntConverter() int? id,
    @StringConverter() String? name,
    @StringConverter() String? description,
    @DoubleConverter() double? price,
    @BoolConverter() bool? isActive,
    @DateTimeConverter() DateTime? createdAt,
    @DateTimeConverter() DateTime? updatedAt,
    @ListConverter() List<dynamic>? tags,
    @ListConverter() List<dynamic>? categories,
  }) = _ExampleModel;

  factory ExampleModel.fromJson(Map<String, dynamic> json) => _$ExampleModelFromJson(json);
}

/// Example usage with backend data that has inconsistencies:
/// 
/// ```json
/// {
///   "id": 1,
///   "name": "Example Service",
///   "description": false,  // Backend returns false instead of null/string
///   "price": 30.0,
///   "is_active": true,
///   "created_at": "2025-07-05T09:42:02.059908",  // String date
///   "updated_at": "2025-07-05T09:45:34.826114",  // String date
///   "tags": [1, "tag1", 2, "tag2"],
///   "categories": false  // Backend returns false instead of null/array
/// }
/// ```
/// 
/// The converters will handle:
/// - `description: false` → `description: null`
/// - `created_at: "2025-07-05T09:42:02.059908"` → `createdAt: DateTime(2025, 7, 5, 9, 42, 2)`
/// - `categories: false` → `categories: null`
/// - `is_active: true` → `isActive: true`
/// - `price: 30.0` → `price: 30.0`
/// - `tags: [1, "tag1", 2, "tag2"]` → `tags: [1, "tag1", 2, "tag2"]` 