import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class CustomLogger extends LogPrinter {
  final String className;
  final bool disableLogger;

  CustomLogger({required this.className, required this.disableLogger});
  @override
  List<String> log(LogEvent event) {
    if (!kDebugMode) return [];
    final color = PrettyPrinter.defaultLevelColors[event.level]!;
    final emoji = PrettyPrinter.defaultLevelEmojis[event.level];
    if (disableLogger) {
      return [];
    }
    return [color('$emoji $className - ${event.message}')];
  }
}

Logger getLogger(String className, {bool disableLogger = false}) =>
    Logger(printer: CustomLogger(className: className, disableLogger: disableLogger));

logResponse(response, {String? name}) {
  if (!kDebugMode) return;
  log(jsonEncode(response).trim(), name: name ?? 'DEBUG');
}
