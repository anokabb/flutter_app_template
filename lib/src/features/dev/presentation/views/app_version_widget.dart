// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'dev_mode_view.dart';

/// A [GestureDetector] that listens for 5 taps to open the dev mode view.
class DevViewGestureDetector extends StatefulWidget {
  final bool safeArea;
  final Widget child;

  const DevViewGestureDetector({
    super.key,
    this.safeArea = true,
    required this.child,
  });

  @override
  State<DevViewGestureDetector> createState() => _DevViewGestureDetectorState();
}

class _DevViewGestureDetectorState extends State<DevViewGestureDetector> {
  int tapCount = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          tapCount++;
          if (tapCount == 5) {
            _timer?.cancel(); // Cancel previous timer if any
            context.push(DevModeView.routeName);
            tapCount = 0; // Reset tap count
          } else {
            // Start a timer to reset tap count after 1 second
            _timer?.cancel(); // Cancel previous timer if any
            _timer = Timer(const Duration(seconds: 1), () {
              setState(() {
                tapCount = 0; // Reset tap count
              });
            });
          }
        });
      },
      child: SafeArea(
        bottom: widget.safeArea,
        child: widget.child,
      ),
    );
  }
}

class AppVersionWidget extends StatefulWidget {
  const AppVersionWidget({super.key});

  @override
  State<AppVersionWidget> createState() => _AppVersionWidgetState();
}

class _AppVersionWidgetState extends State<AppVersionWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox();
          PackageInfo packageInfo = snapshot.data as PackageInfo;
          return DevViewGestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '${context.localization.version} ${packageInfo.version}',
                style: context.theme.appTextTheme.body3.copyWith(
                  color: context.theme.appColors.textColor.withOpacity(0.6),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AppVersionWrapper extends StatelessWidget {
  const AppVersionWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: child,
        ),
        AppVersionWidget(),
      ],
    );
  }
}
