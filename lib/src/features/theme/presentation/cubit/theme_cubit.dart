import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app_template/src/core/constants/hive_config.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(selectedTheme: ThemeState.light)) {
    getTheme();
  }

  static bool get isDarkMode => locator<ThemeCubit>().state.isDarkMode;

  Future<void> getTheme() async {
    final int selectedTheme = settingsBox.get('selectedTheme', defaultValue: ThemeState.light);
    emit(ThemeState(selectedTheme: selectedTheme));
  }

  void changeTheme(int selectedTheme) {
    if (selectedTheme != state.selectedTheme) {
      emit(ThemeState(selectedTheme: selectedTheme));
      settingsBox.put('selectedTheme', selectedTheme);
    }
  }
}
