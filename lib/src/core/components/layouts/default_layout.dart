import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';

class DefaultLayout extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget child;
  final String? title;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final Widget? leading;
  final List<Widget>? actions;
  final Function()? onBackPressed;

  const DefaultLayout({
    super.key,
    this.appBar,
    this.title,
    this.backgroundColor,
    required this.child,
    this.floatingActionButton,
    this.leading,
    this.actions,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onBackPressed != null) {
          onBackPressed!();
          return false;
        }
        return true;
      },
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Container(
          color: context.theme.appColors.primary,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: <Widget>[
                      appBar ??
                          (title == null
                              ? SizedBox()
                              : Container(
                                  child: AppBar(
                                    title: Text(
                                      title!,
                                      style: context.theme.appTextTheme.body1.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: context.theme.appColors.onBackground,
                                      ),
                                    ),
                                    actions: actions,
                                    leading: leading,
                                    centerTitle: true,
                                    surfaceTintColor: Colors.transparent,
                                    backgroundColor: context.theme.appColors.background,
                                    elevation: 0,
                                  ),
                                )),
                      Expanded(
                        child: Container(
                          color: backgroundColor ?? context.theme.appColors.background,
                          child: SafeArea(
                            child: Scaffold(
                              backgroundColor: backgroundColor ?? context.theme.appColors.background,
                              appBar: appBar,
                              body: child,
                              floatingActionButton: floatingActionButton,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
