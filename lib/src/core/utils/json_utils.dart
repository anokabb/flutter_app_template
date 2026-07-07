import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

/// Global JSON conversion utilities to handle backend data type inconsistencies
class JsonUtils {
  /// Converts a value to String, handling false/null values
  /// Returns null if the value is false, null, or empty string
  static String? stringFromJson(dynamic value) {
    if (value == null || value == false || value == '') {
      return null;
    }
    return value.toString();
  }

  /// Converts a value to int, handling false/null values
  static int? intFromJson(dynamic value) {
    if (value == null || value == false) {
      return null;
    }
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      final parsed = int.tryParse(value);
      return parsed;
    }
    return null;
  }

  /// Converts a value to double, handling false/null values
  static double? doubleFromJson(dynamic value) {
    if (value == null || value == false) {
      return null;
    }
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      final parsed = double.tryParse(value);
      return parsed;
    }
    return null;
  }

  /// Converts a value to bool, handling false/null values
  static bool? boolFromJson(dynamic value) {
    if (value == null) {
      return null;
    }
    if (value is bool) return value;
    if (value is String) {
      return value.toLowerCase() == 'true';
    }
    if (value is int) {
      return value != 0;
    }
    return null;
  }

  /// Converts a value to DateTime, handling false/null values and string dates
  static DateTime? dateTimeFromJson(dynamic value) {
    if (value == null || value == false) {
      return null;
    }
    if (value is DateTime) return value;
    if (value is String) {
      try {
        return DateTime.parse(value);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Converts a value to List<dynamic>, handling false/null values
  static List<dynamic>? listFromJson(dynamic value) {
    if (value == null || value == false) {
      return null;
    }
    if (value is List) return value;
    return null;
  }

  /// Converts a value to Map<String, dynamic>, handling false/null values
  static Map<String, dynamic>? mapFromJson(dynamic value) {
    if (value == null || value == false) {
      return null;
    }
    if (value is Map<String, dynamic>) return value;
    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }
    return null;
  }

  /// Converts a base64 string to Uint8List, handling false/null values and b'' prefix
  static Uint8List? uint8ListFromJson(dynamic value) {
    if (value == null || value == false || value == '') {
      return null;
    }
    try {
      String base64String = value.toString();
      // Remove Python's b'' prefix and suffix if present
      base64String = base64String.replaceAll("b'", "").replaceAll("'", "");
      return base64Decode(base64String);
    } catch (e) {
      print('Error decoding base64: $e');
      return null;
    }
  }

  /// Converts a Uint8List to base64 string
  static String? uint8ListToJson(Uint8List? value) {
    if (value == null) return null;
    try {
      return base64Encode(value);
    } catch (e) {
      print('Error encoding base64: $e');
      return null;
    }
  }
}

/// Custom JSON converter for String fields that handles false values
class StringConverter implements JsonConverter<String?, dynamic> {
  const StringConverter();

  @override
  String? fromJson(dynamic json) => JsonUtils.stringFromJson(json);

  @override
  dynamic toJson(String? object) => object;
}

/// Custom JSON converter for int fields that handles false values
class IntConverter implements JsonConverter<int?, dynamic> {
  const IntConverter();

  @override
  int? fromJson(dynamic json) => JsonUtils.intFromJson(json);

  @override
  dynamic toJson(int? object) => object;
}

/// Custom JSON converter for double fields that handles false values
class DoubleConverter implements JsonConverter<double?, dynamic> {
  const DoubleConverter();

  @override
  double? fromJson(dynamic json) => JsonUtils.doubleFromJson(json);

  @override
  dynamic toJson(double? object) => object;
}

/// Custom JSON converter for bool fields that handles false values
class BoolConverter implements JsonConverter<bool?, dynamic> {
  const BoolConverter();

  @override
  bool? fromJson(dynamic json) => JsonUtils.boolFromJson(json);

  @override
  dynamic toJson(bool? object) => object;
}

/// Custom JSON converter for DateTime fields that handles string dates
class DateTimeConverter implements JsonConverter<DateTime?, dynamic> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(dynamic json) => JsonUtils.dateTimeFromJson(json);

  @override
  dynamic toJson(DateTime? object) => object?.toIso8601String();
}

/// Custom JSON converter for Uint8List fields that handles base64 encoded strings
class Uint8ListConverter implements JsonConverter<Uint8List?, dynamic> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(dynamic json) => JsonUtils.uint8ListFromJson(json);

  @override
  dynamic toJson(Uint8List? object) => JsonUtils.uint8ListToJson(object);
}

/// Custom JSON converter for List fields that handles false values
class ListConverter implements JsonConverter<List<dynamic>?, dynamic> {
  const ListConverter();

  @override
  List<dynamic>? fromJson(dynamic json) => JsonUtils.listFromJson(json);

  @override
  dynamic toJson(List<dynamic>? object) => object;
}

class IdNamePair {
  final int? id;
  final String? name;

  const IdNamePair({this.id, this.name});
}

class IdNamePairConverter implements JsonConverter<IdNamePair?, dynamic> {
  const IdNamePairConverter();

  @override
  IdNamePair? fromJson(dynamic json) {
    if (json == null) return null;

    // If already an IdNamePair object, return as is
    if (json is IdNamePair) return json;

    // If it's a List with at least 2 elements, parse as [id, name]
    if (json is List && json.length >= 2) {
      return IdNamePair(
        id: JsonUtils.intFromJson(json[0]),
        name: JsonUtils.stringFromJson(json[1]),
      );
    }
    // If it's a Map with 'id' and 'name' keys, parse accordingly
    if (json is Map<String, dynamic>) {
      return IdNamePair(
        id: JsonUtils.intFromJson(json['id']),
        name: JsonUtils.stringFromJson(json['name']),
      );
    }
    return null;
  }

  @override
  dynamic toJson(IdNamePair? pair) {
    if (pair == null) return null;
    return [pair.id, pair.name];
  }
}

class IdNamePairListConverter implements JsonConverter<List<IdNamePair>?, List<dynamic>> {
  const IdNamePairListConverter();

  @override
  List<IdNamePair>? fromJson(List<dynamic> json) {
    return json.map((e) => const IdNamePairConverter().fromJson(e)).whereType<IdNamePair>().toList();
  }

  @override
  List<dynamic> toJson(List<IdNamePair>? pairs) {
    if (pairs == null) return [];
    return pairs.map((e) => const IdNamePairConverter().toJson(e)).toList();
  }
}
