import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/dropdown_button/dropdown_model.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/routing/app_router.dart';

enum DateSelectionType { today, yesterday, thisWeek, lastWeek, lastMonth, lastThreeMonths, customRange }

extension EDateTimeRange on DateTimeRange {
  DateSelectionType? get getDateSelectionType {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final startDate = DateTime(start.year, start.month, start.day);
    final endDate = DateTime(end.year, end.month, end.day);

    if (startDate.isAtSameMomentAs(todayStart) && endDate.isAtSameMomentAs(todayStart)) {
      return DateSelectionType.today;
    } else if (startDate.isAtSameMomentAs(todayStart.subtract(const Duration(days: 1))) &&
        endDate.isAtSameMomentAs(todayStart.subtract(const Duration(days: 1)))) {
      return DateSelectionType.yesterday;
    } else if (startDate.isAtSameMomentAs(todayStart.subtract(Duration(days: now.weekday - 1))) &&
        endDate.isAtSameMomentAs(todayStart)) {
      return DateSelectionType.thisWeek;
    } else if (startDate.isAtSameMomentAs(todayStart.subtract(Duration(days: now.weekday + 6))) &&
        endDate.isAtSameMomentAs(todayStart.subtract(Duration(days: now.weekday)))) {
      return DateSelectionType.lastWeek;
    } else if (startDate.month == todayStart.month - 1 && startDate.year == todayStart.year) {
      return DateSelectionType.lastMonth;
    } else if (startDate.month == todayStart.month - 3 && startDate.year == todayStart.year) {
      return DateSelectionType.lastThreeMonths;
    }
    return null;
  }
}

extension DateSelectionTypeExt on DateSelectionType {
  DateTimeRange get getDateRange {
    final now = DateTime.now();
    switch (this) {
      case DateSelectionType.today:
        return DateTimeRange(
          start: DateTime(now.year, now.month, now.day),
          end: DateTime(now.year, now.month, now.day, 23, 59, 59),
        );
      case DateSelectionType.yesterday:
        final yesterday = now.subtract(const Duration(days: 1));
        return DateTimeRange(
          start: DateTime(yesterday.year, yesterday.month, yesterday.day),
          end: DateTime(yesterday.year, yesterday.month, yesterday.day, 23, 59, 59),
        );
      case DateSelectionType.thisWeek:
        final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        return DateTimeRange(
          start: DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day),
          end: DateTime(now.year, now.month, now.day, 23, 59, 59),
        );
      case DateSelectionType.lastWeek:
        final startOfLastWeek = now.subtract(Duration(days: now.weekday + 6));
        return DateTimeRange(
          start: DateTime(startOfLastWeek.year, startOfLastWeek.month, startOfLastWeek.day),
          end: DateTime(startOfLastWeek.year, startOfLastWeek.month, startOfLastWeek.day + 6, 23, 59, 59),
        );
      case DateSelectionType.lastMonth:
        final startOfLastMonth = DateTime(now.year, now.month - 1, 1);
        final endOfLastMonth = DateTime(now.year, now.month, 0, 23, 59, 59);
        return DateTimeRange(
          start: startOfLastMonth,
          end: endOfLastMonth,
        );
      case DateSelectionType.lastThreeMonths:
        final startOfLastThreeMonths = DateTime(now.year, now.month - 3, 1);
        final endOfLastThreeMonths = DateTime(now.year, now.month, 0, 23, 59, 59);
        return DateTimeRange(
          start: startOfLastThreeMonths,
          end: endOfLastThreeMonths,
        );
      case DateSelectionType.customRange:
        return DateTimeRange(start: now, end: now);
    }
  }

  Future<DateTimeRange> get getDateRangeSync async {
    final now = DateTime.now();
    switch (this) {
      case DateSelectionType.customRange:
        if (rootNavigatorKey.currentContext == null) return DateTimeRange(start: now, end: now);
        return await (showDateRangePicker(
              context: rootNavigatorKey.currentContext!,
              firstDate: DateTime(2000),
              lastDate: DateTime.now().add(const Duration(days: 30)),
            )) ??
            DateTimeRange(start: now, end: now);
      default:
        return getDateRange;
    }
  }
}

List<DropdownModel> dateRangeSelectionEntries(BuildContext context) => [
      DropdownModel(id: DateSelectionType.today.name, title: context.localization.today),
      DropdownModel(id: DateSelectionType.yesterday.name, title: context.localization.yesterday),
      DropdownModel(id: DateSelectionType.thisWeek.name, title: context.localization.thisWeek),
      DropdownModel(id: DateSelectionType.lastWeek.name, title: context.localization.lastWeek),
      DropdownModel(id: DateSelectionType.lastMonth.name, title: context.localization.lastMonth),
      DropdownModel(id: DateSelectionType.lastThreeMonths.name, title: context.localization.last90Days),
      DropdownModel(id: DateSelectionType.customRange.name, title: context.localization.customDate),
    ];
