import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/routing/app_router.dart';

/// Base class for custom pop-up views.
abstract class CustomPopUpView extends StatefulWidget {
  final bool needFullScreen;
  final bool disableSafeArea;
  const CustomPopUpView({super.key, this.needFullScreen = false, this.disableSafeArea = false});

  /// Method to show the pop-up view.
  static Future<T?> show<T>({
    BuildContext? context,
    bool requireLogin = false,
    required CustomPopUpView view,
  }) async {
    BuildContext? currentContext = context ?? rootNavigatorKey.currentContext;
    if (currentContext == null) {
      showTopError('Error occurred, please try again');
      return null;
    }

    return await showModalBottomSheet<T>(
      context: currentContext,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (bottomSheetContext) => view,
    );
  }

  @override
  State<CustomPopUpView> createState();
}

/// State class for the custom pop-up view.
abstract class CustomPopUpViewState<T extends CustomPopUpView> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: EdgeInsets.only(top: widget.needFullScreen ? 0 : 80),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: widget.needFullScreen
                      ? null
                      : const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                ),
                child: SafeArea(
                  top: false,
                  bottom: !widget.disableSafeArea,
                  child: buildContent(context),
                ),
              ),
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
