import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/routing/app_router.dart';
import 'package:go_router/go_router.dart';

/// Base class for custom pop-up views.
abstract class CustomDialogPopUpView extends StatefulWidget {
  final bool needFullScreen;
  final bool barrierDismissible;
  const CustomDialogPopUpView({super.key, this.needFullScreen = false, this.barrierDismissible = true});

  /// Method to show the pop-up view.
  static Future<bool?> show({
    BuildContext? context,
    bool requireLogin = false,
    bool needClose = false,
    Duration closeAfter = Duration.zero,
    required CustomDialogPopUpView view,
    EdgeInsets? padding,
  }) async {
    BuildContext? currentContext = context ?? rootNavigatorKey.currentContext;
    padding ??= const EdgeInsets.all(20);

    Timer? timer;

    if (currentContext == null) {
      showTopError('Error occurred, please try again');
      return null;
    }

    if (needClose && context != null) {
      timer = Timer(closeAfter, () => Navigator.of(context, rootNavigator: true).pop());
    }

    return await showDialog(
      context: currentContext,
      useSafeArea: true,
      barrierDismissible: view.barrierDismissible,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide.none),
        child: view,
      ),
    ).then((value) {
      timer?.cancel();
      timer = null;
      return null;
    });
  }

  /// Method to show the pop-up view.
  static Future<bool?> showFullScreenDialog({
    BuildContext? context,
    bool requireLogin = false,
    bool needClose = false,
    Duration closeAfter = Duration.zero,
    required CustomDialogPopUpView view,
  }) async {
    BuildContext? currentContext = context ?? rootNavigatorKey.currentContext;
    Timer? timer;

    if (currentContext == null) {
      showTopError('Error occurred, please try again');
      return null;
    }

    if (needClose && context != null) {
      timer = Timer(closeAfter, () => Navigator.of(context, rootNavigator: true).pop());
    }

    return await showGeneralDialog(
      context: currentContext,
      pageBuilder: (dialogContext, _, __) => Container(
        width: double.infinity,
        color: Colors.transparent,
        child: view,
      ),
    ).then((value) {
      timer?.cancel();
      timer = null;
      return null;
    });
  }

  @override
  State<CustomDialogPopUpView> createState();
}

/// State class for the custom pop-up view.
abstract class CustomDialogPopUpViewState<T extends CustomDialogPopUpView> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.barrierDismissible == false ? null : context.pop,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.only(top: widget.needFullScreen ? 0 : 60),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: SafeArea(
              top: false,
              bottom: widget.needFullScreen ? false : true,
              child: buildContent(context),
            ),
          ),
        ),
      ),
    );
  }

  /// Implement this method to build the content of the pop-up view.
  Widget buildContent(BuildContext context);

  @override
  void dispose() {
    super.dispose();
  }
}
