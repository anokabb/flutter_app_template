import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/l10n/app_localizations.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_button.dart';
import 'package:flutter_app_template/src/core/components/pop_up/app_pop_up.dart';
import 'package:flutter_app_template/src/core/constants/env_config.dart';
import 'package:flutter_app_template/src/core/constants/hive_config.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/routing/app_router.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/features/languages/presentation/cubit/language_cubit.dart';
import 'package:flutter_app_template/src/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:upgrader/upgrader.dart';

class App extends StatelessWidget {
  const App({super.key, required this.routerConfig});
  final GoRouter routerConfig;

  @override
  Widget build(BuildContext context) {
    // set to portrait only. Override on specific pages.
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MultiBlocProvider(
      providers: blocProviders,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          // log(themeMode.name);
          return BlocBuilder<LanguageCubit, Locale?>(
            builder: (context, locale) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: EnvConfig.APP_NAME,
                theme: AppTheme.light(
                  AppTheme.getFontFamily(locale?.languageCode ?? DEFAULT_LANGUAGE.name),
                ),
                themeMode: themeState.themeMode,
                routerConfig: routerConfig,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: locale,
                builder: (context, child) {
                  Widget upgraderChild = UpgradeAlert(
                    navigatorKey: rootNavigatorKey,
                    barrierDismissible: !EnvConfig.FORCE_UPDATE,
                    dialogStyle: UpgradeDialogStyle.cupertino,
                    upgrader: Upgrader(
                      debugDisplayAlways: devBox.get('debugUpgrader', defaultValue: false),
                      durationUntilAlertAgain: const Duration(days: 1),
                    ),
                    child: child,
                    customDialog: (
                      Key? key,
                      String title,
                      String message,
                      String? releaseNotes,
                      BuildContext context,
                      bool cupertino,
                      UpgraderMessages messages,
                      Function() onIgnore,
                      Function() onUpdate,
                      Function() onCancel,
                    ) {
                      return AppPopUp(
                        title: title,
                        description: message,
                        confirmText: context.localization.updateNow.toUpperCase(),
                        onConfirm: onUpdate,
                        actions: [
                          if (!EnvConfig.FORCE_UPDATE)
                            AppButton(
                              label: context.localization.later.toUpperCase(),
                              backgroundColor: context.theme.appColors.secondaryBackground,
                              onPressed: onIgnore,
                            ),
                        ],
                      );
                    },
                  );

                  if (EnvConfig.showEnvBanner) {
                    return Banner(
                      message: EnvConfig.currentEnv.toUpperCase(),
                      location: BannerLocation.bottomEnd,
                      child: upgraderChild,
                    );
                  }
                  return upgraderChild;
                },
              );
            },
          );
        },
      ),
    );
  }
}
