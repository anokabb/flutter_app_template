import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/features/languages/presentation/cubit/language_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

extension EString on String {
  String get capitalizeFirst {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get capitalizeFirstEachWord {
    return split(' ').map((word) => word.capitalizeFirst).join(' ');
  }

  String get removeAllWhitespace => replaceAll(RegExp(r'\s+'), '');

  String get lastPathSegment {
    return split('/').last;
  }

  String get digitsToZeroDigit {
    return replaceAll(RegExp(r'\d'), '0');
  }

}

extension EDuration on Duration {
  String get toMinutes {
    return inMinutes.toString();
  }

  String get toHours {
    return inHours.toString();
  }

  String get toSeconds {
    return inSeconds.toString();
  }

  String get toHHMMSS {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    if (inHours > 0) {
      return '${twoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds';
    } else {
      return '$twoDigitMinutes:$twoDigitSeconds';
    }
  }

  String get toFormattedTime {
    List<String> parts = [];

    if (inHours > 0) {
      parts.add('${inHours}h');
    }
    if (inMinutes.remainder(60) > 0) {
      parts.add('${inMinutes.remainder(60)}m');
    }
    if (inSeconds.remainder(60) > 0 && inHours == 0) {
      parts.add('${inSeconds.remainder(60)}s');
    }

    return parts.isEmpty ? '0s' : parts.join(' ');
  }
}

extension EDateTime on DateTime {
  String get toMMDD {
    return DateFormat('MM/dd').format(this);
  }

  String get toWeekday {
    return DateFormat('EEE').format(this);
  }

  DateTime get toDateOnly {
    return DateTime(year, month, day);
  }
}

extension EWidget on Widget {
  Widget paddingDirectional({
    required EdgeInsetsGeometry ltr,
    required EdgeInsetsGeometry rtl,
  }) {
    return BlocBuilder<LanguageCubit, Locale?>(
      builder: (context, locale) {
        bool isRTL = locale?.languageCode == 'ar';
        return Padding(
          padding: isRTL ? rtl : ltr,
          child: this,
        );
      },
    );
  }

  Widget alignDirectional({
    required AlignmentGeometry ltr,
    required AlignmentGeometry rtl,
  }) {
    return BlocBuilder<LanguageCubit, Locale?>(
      builder: (context, locale) {
        bool isRTL = locale?.languageCode == 'ar';
        return Align(
          alignment: isRTL ? rtl : ltr,
          child: this,
        );
      },
    );
  }
}
