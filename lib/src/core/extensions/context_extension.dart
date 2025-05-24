import 'package:flutter/material.dart';
import 'package:flutter_app_template/l10n/app_localizations.dart';
import 'package:flutter_app_template/src/core/routing/app_router.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/core/services/theme/app_colors.dart';
import 'package:flutter_app_template/src/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

extension AppLocalizationsExtension on AppLocalizations {
  String getString(String key) {
    final Map<String, String> localizedStrings = {
      // 'key': value,
    };

    return localizedStrings[key.toLowerCase()] ?? key;
  }
}

extension EBuildContext on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
  bool get isDarkMode => locator<ThemeCubit>().state.isDarkMode;

  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: isError ? Colors.red : AppColors.green,
      ),
    );
  }

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

void showTopError(String message) {
  showTopAlert(message, isError: true);
}

void showTopAlert(String message, {bool isError = false}) {
  OverlayState? overlayState = rootNavigatorKey.currentState?.overlay;
  if (overlayState == null) {
    return;
  }
  showTopSnackBar(
    overlayState,
    isError
        ? CustomSnackBar.error(
            maxLines: 4,
            message: message,
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          )
        : CustomSnackBar.success(
            maxLines: 4,
            message: message,
            backgroundColor: Colors.green,
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
    reverseAnimationDuration: const Duration(milliseconds: 300),
  );
}
