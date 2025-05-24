import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/default_layout.dart';
import 'package:flutter_app_template/src/core/constants/env_config.dart';
import 'package:flutter_app_template/src/core/constants/hive_config.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/extensions/extensions.dart';
import 'package:flutter_app_template/src/core/routing/app_router.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/core/services/notifications/notification_service.dart';
import 'package:flutter_app_template/src/core/services/theme/app_colors.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:restart_app/restart_app.dart';

class DevModeView extends StatefulWidget {
  static const routeName = '/dev-mode';
  const DevModeView({super.key});

  @override
  State<DevModeView> createState() => _DevModeViewState();
}

class _DevModeViewState extends State<DevModeView> {
  String? fcmToken;
  final ValueNotifier<Duration> _timeToExpire = ValueNotifier(Duration.zero);
  Timer? _timer;

  bool debugUpgrader = devBox.get('debugUpgrader', defaultValue: false);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fcm.getToken().then(
            (value) => setState(() {
              fcmToken = value;
            }),
          );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timeToExpire.dispose();
  }

  String getDetails(PackageInfo info) {
    return [
      'Version: ${info.version}',
      'Build Number: ${info.buildNumber}',
      'Package Name: ${info.packageName}',
      'FCM TOKEN: $fcmToken',
    ].join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Dev Mode',
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppButton(
            isAsync: true,
            onPressed: () async {
              await locator<AuthCubit>().logout();
              context.go(AppRouter.baseRoute);
            },
            icon: Icon(
              Icons.logout,
              color: context.theme.appColors.textColor,
            ),
            label: context.localization.logout,
            isOutlined: true,
          ),
          SizedBox(height: 8),
          AppButton(
            onPressed: () => throw Exception(),
            label: 'Throw Test Exception',
            textColor: AppColors.red,
            isTextButton: true,
          ),
          SizedBox(height: 16),
          Text(
            'App Information',
            style: context.theme.appTextTheme.body1.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox(height: 100, child: Center(child: CircularProgressIndicator()));
              }
              String display = getDetails(snapshot.data as PackageInfo);
              return Center(
                child: GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: display));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Copied to clipboard')));
                  },
                  child: SelectableText(
                    display,
                    style: context.theme.appTextTheme.body1.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16),
          Text(
            'App Environment',
            style: context.theme.appTextTheme.body1.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Center(
            child: DropdownButton<String>(
              value: EnvConfig.currentEnv,
              dropdownColor: context.theme.appColors.background,
              borderRadius: BorderRadius.circular(10),
              hint: const Text('Select Environment'),
              items: [
                ...ConfigEnvironments.values.map(
                  (e) => DropdownMenuItem(
                    value: e.name,
                    child: Text(e.name.capitalizeFirst),
                  ),
                ),
              ],
              onChanged: (e) async {
                if (e == null) return;
                await devBox.put('env', e);

                await locator<AuthCubit>().logout();
                Restart.restartApp();
              },
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            title: const Text('Enable Debug Upgrader'),
            contentPadding: EdgeInsets.zero,
            trailing: Switch(
              activeTrackColor: Colors.green,
              inactiveTrackColor: Colors.grey.withOpacity(0.4),
              trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
              thumbColor: WidgetStateProperty.all(Colors.white),
              value: debugUpgrader,
              onChanged: (value) async {
                setState(() {
                  debugUpgrader = value;
                });
                await devBox.put('debugUpgrader', value);
              },
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
