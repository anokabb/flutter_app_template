import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/constants/hive_config.dart';
import 'package:flutter_app_template/src/features/languages/presentation/pages/language_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const DEFAULT_LANGUAGE = LanguageEnum.ar;

class LanguageCubit extends Cubit<Locale?> {
  LanguageCubit() : super(null) {
    getLanguage();
  }

  bool get isRTL {
    return state?.languageCode == 'ar';
  }

  Future<void> getLanguage() async {
    final String languageCode = settingsBox.get(
      'language_code',
      defaultValue: DEFAULT_LANGUAGE.name,
    );

    emit(Locale(languageCode));
  }

  Future<void> updateLanguage(final Locale locale) async {
    await settingsBox.put('language_code', locale.languageCode);
    emit(locale);
  }
}
