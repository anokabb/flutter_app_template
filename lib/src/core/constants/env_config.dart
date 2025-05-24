import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/src/core/constants/hive_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum ConfigEnvironments { dev, staging, production }

class EnvConfig {
  static const String APP_NAME = 'Flutter App';

  static String get baseUrl => dotenv.get('BASE_URL', fallback: '');
  static bool get showEnvBanner => devBox.get('showEnvBanner', defaultValue: kDebugMode ? true : false);
  static String get currentEnv => devBox.get(
        'env',
        defaultValue: String.fromEnvironment(
          'ENV',
          defaultValue: ConfigEnvironments.staging.name,
        ),
      );

  static Future<void> loadEnv() async {
    await dotenv.load(fileName: '$currentEnv.env');
  }

  void changeEnv(String env) {
    devBox.put('env', env);
  }

  static const bool FORCE_UPDATE = false;

// for testing in debug mode
  static String get TEST_PHONE_NUMBER => !kDebugMode ? '' : dotenv.get('TEST_PHONE_NUMBER', fallback: '');
  static String get TEST_OTP => !kDebugMode ? '' : dotenv.get('TEST_OTP', fallback: '');
  static String get TEST_EMAIL => !kDebugMode ? '' : dotenv.get('TEST_EMAIL', fallback: '');
  static String get TEST_PASSWORD => !kDebugMode ? '' : dotenv.get('TEST_PASSWORD', fallback: '');
}
