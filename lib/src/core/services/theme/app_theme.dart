import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/core/services/theme/app_color_extention.dart';
import 'package:flutter_app_template/src/core/services/theme/app_colors.dart';
import 'package:flutter_app_template/src/core/services/theme/app_text_theme_extension.dart';
import 'package:flutter_app_template/src/core/services/theme/app_typography.dart';
import 'package:flutter_app_template/src/features/languages/presentation/cubit/language_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static String? get fontFamily {
    final languageCubit = locator<LanguageCubit>();
    if (languageCubit.state?.languageCode == 'ar') {
      return GoogleFonts.cairo().fontFamily;
    }
    return GoogleFonts.robotoSlab().fontFamily;
  }

  static SimpleAppTextThemeExtension lightTextTheme(String? fontFamily) => SimpleAppTextThemeExtension(
        h1: AppTypography.h1.copyWith(color: AppColors.black, fontFamily: fontFamily),
        h2: AppTypography.h2.copyWith(color: AppColors.black, fontFamily: fontFamily),
        h3: AppTypography.h3.copyWith(color: AppColors.black, fontFamily: fontFamily),
        h4: AppTypography.h4.copyWith(color: AppColors.black, fontFamily: fontFamily),
        h5: AppTypography.h5.copyWith(color: AppColors.black, fontFamily: fontFamily),
        h6: AppTypography.h6.copyWith(color: AppColors.black, fontFamily: fontFamily),
        title: AppTypography.title.copyWith(color: AppColors.black, fontFamily: fontFamily),
        subtitle1: AppTypography.subtitle1.copyWith(color: AppColors.black, fontFamily: fontFamily),
        subtitle2: AppTypography.subtitle2.copyWith(color: AppColors.black, fontFamily: fontFamily),
        subtitle3: AppTypography.subtitle3.copyWith(color: AppColors.black, fontFamily: fontFamily),
        body1: AppTypography.body1.copyWith(color: AppColors.black, fontFamily: fontFamily),
        body2: AppTypography.body2.copyWith(color: AppColors.black, fontFamily: fontFamily),
        body3: AppTypography.body3.copyWith(color: AppColors.black, fontFamily: fontFamily),
      );

  static ThemeData light(String? fontFamily) {
    final defaultTheme = ThemeData(
      fontFamily: fontFamily,
    );

    return defaultTheme.copyWith(
      scaffoldBackgroundColor: _lightAppColors.background,
      textTheme: defaultTheme.textTheme.copyWith(
        bodyMedium: AppTypography.body1.copyWith(color: AppColors.black),
      ),
      colorScheme: ColorScheme.fromSwatch(brightness: Brightness.light).copyWith(
        error: _lightAppColors.error,
      ),
      dividerTheme: DividerThemeData(
        color: _lightAppColors.borderColor,
        thickness: 0.7,
        space: 0,
      ),
      primaryColor: _lightAppColors.primary,
      primaryColorDark: _lightAppColors.secondary,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _lightAppColors.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: _lightAppColors.borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _lightAppColors.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _lightAppColors.error),
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: lightTextTheme(fontFamily).body1.copyWith(color: _lightAppColors.textColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _lightAppColors.primary,
          foregroundColor: _lightAppColors.onPrimary,
          elevation: 0,
          disabledBackgroundColor: _lightAppColors.primary.withOpacity(0.2),
          disabledForegroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: _lightAppColors.borderColor,
            ),
          ),
        ),
      ),
      extensions: [
        _lightAppColors,
        lightTextTheme(fontFamily),
      ],
    );
  }

  static final _lightAppColors = AppColorsExtension(
    primary: AppColors.darkBlue,
    onPrimary: Colors.white,
    secondary: Colors.white,
    onSecondary: AppColors.black,
    error: AppColors.red,
    onError: Colors.white,
    background: Colors.white,
    onBackground: AppColors.black,
    secondaryBackground: AppColors.grey,
    surface: Colors.white,
    onSurface: AppColors.black,
    borderColor: AppColors.darkGrey,
    textColor: AppColors.black,
  );
  // *** Dark theme ***

// *** Dark theme ***

  static ThemeData dark(String? fontFamily) {
    final defaultTheme = ThemeData(
      brightness: Brightness.dark,
      fontFamily: fontFamily,
    );

    return defaultTheme.copyWith(
      scaffoldBackgroundColor: _darkAppColors.background,
      textTheme: defaultTheme.textTheme.copyWith(
        bodyMedium: AppTypography.body1.copyWith(color: Colors.white),
      ),
      colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark).copyWith(
        error: _darkAppColors.error,
      ),
      dividerTheme: DividerThemeData(
        color: _darkAppColors.borderColor,
        thickness: 0.7,
        space: 0,
      ),
      primaryColor: _darkAppColors.primary,
      primaryColorDark: _darkAppColors.secondary,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _darkAppColors.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.darkGrey,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: _darkAppColors.borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkAppColors.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkAppColors.error),
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: darkTextTheme(fontFamily).body1.copyWith(color: _darkAppColors.textColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _darkAppColors.primary,
          foregroundColor: _darkAppColors.onPrimary,
          elevation: 0,
          textStyle: darkTextTheme(fontFamily).body1.copyWith(
                color: _darkAppColors.background,
              ),
          disabledBackgroundColor: _darkAppColors.primary.withOpacity(0.2),
          disabledForegroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: _darkAppColors.borderColor,
            ),
          ),
        ),
      ),
      extensions: [
        _darkAppColors,
        darkTextTheme(fontFamily),
      ],
    );
  }

  static SimpleAppTextThemeExtension darkTextTheme(String? fontFamily) => SimpleAppTextThemeExtension(
        h1: AppTypography.h1.copyWith(color: Colors.white, fontFamily: fontFamily),
        h2: AppTypography.h2.copyWith(color: Colors.white, fontFamily: fontFamily),
        h3: AppTypography.h3.copyWith(color: Colors.white, fontFamily: fontFamily),
        h4: AppTypography.h4.copyWith(color: Colors.white, fontFamily: fontFamily),
        h5: AppTypography.h5.copyWith(color: Colors.white, fontFamily: fontFamily),
        h6: AppTypography.h6.copyWith(color: Colors.white, fontFamily: fontFamily),
        title: AppTypography.title.copyWith(color: Colors.white, fontFamily: fontFamily),
        subtitle1: AppTypography.subtitle1.copyWith(color: Colors.white, fontFamily: fontFamily),
        subtitle2: AppTypography.subtitle2.copyWith(color: Colors.white, fontFamily: fontFamily),
        subtitle3: AppTypography.subtitle3.copyWith(color: Colors.white, fontFamily: fontFamily),
        body1: AppTypography.body1.copyWith(color: Colors.white, fontFamily: fontFamily),
        body2: AppTypography.body2.copyWith(color: Colors.white, fontFamily: fontFamily),
        body3: AppTypography.body3.copyWith(color: Colors.white, fontFamily: fontFamily),
      );

  static final _darkAppColors = AppColorsExtension(
    primary: AppColors.darkBlue,
    onPrimary: AppColors.black,
    secondary: AppColors.darkGrey,
    onSecondary: Colors.white,
    error: AppColors.red,
    onError: AppColors.black,
    background: Color.fromRGBO(38, 39, 41, 1),
    onBackground: Colors.white,
    secondaryBackground: AppColors.black,
    surface: AppColors.darkGrey,
    onSurface: Colors.white,
    borderColor: Color.fromRGBO(71, 71, 73, 1),
    textColor: Colors.white,
  );
}

extension AppThemeExtension on ThemeData {
  AppColorsExtension get appColors => extension<AppColorsExtension>() ?? AppTheme._lightAppColors;

  SimpleAppTextThemeExtension get appTextTheme =>
      extension<SimpleAppTextThemeExtension>() ?? AppTheme.lightTextTheme(AppTheme.fontFamily);
}

/// A more convenient way to get `ThemeData` from the `BuildContext`.
///
/// Usage example: `context.theme`.
extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}
