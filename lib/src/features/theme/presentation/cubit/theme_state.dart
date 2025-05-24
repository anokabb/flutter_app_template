part of 'theme_cubit.dart';

class ThemeState {
  static const int light = 0;
  static const int dark = 1;
  static const int system = 2;

  static String themeName(int val) {
    switch (val) {
      case light:
        return 'Light';
      case dark:
        return 'Dark';
      case system:
        return 'System';
      default:
        return 'System';
    }
  }

  bool get isDarkMode {
    if (selectedTheme == system) {
      var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return selectedTheme == dark;
    }
  }

  ThemeMode get themeMode {
    switch (selectedTheme) {
      case light:
        return ThemeMode.light;
      case dark:
        return ThemeMode.dark;
      case system:
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  final int selectedTheme;

  ThemeState({required this.selectedTheme});

  Map<String, dynamic> toMap() {
    return {
      'selectedTheme': selectedTheme,
    };
  }

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(selectedTheme: map['selectedTheme']);
  }
}
