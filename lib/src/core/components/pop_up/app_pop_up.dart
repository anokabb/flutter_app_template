import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_button.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/features/theme/presentation/cubit/theme_cubit.dart';

class AppPopUp extends StatelessWidget {
  final String title;
  final String? description;
  final String? confirmText;
  final String? cancelText;
  final Widget? icon;
  final dynamic Function()? onConfirm;
  final dynamic Function()? onCancel;
  final List<Widget>? actions;
  final Widget? child;
  final bool? barrierDismissible;
  final Color? confirmButtonColor;
  final bool showCloseButton;

  const AppPopUp({
    super.key,
    required this.title,
    this.description,
    this.confirmText,
    this.onConfirm,
    this.cancelText,
    this.onCancel,
    this.icon,
    this.actions,
    this.child,
    this.barrierDismissible,
    this.confirmButtonColor,
    this.showCloseButton = true,
  });

  static Future show(
    BuildContext context, {
    required String title,
    String? description,
    String? confirmText,
    dynamic Function(BuildContext cnt)? onConfirm,
    String? cancelText,
    dynamic Function(BuildContext cnt)? onCancel,
    Widget? icon,
    List<Widget>? actions,
    bool? barrierDismissible,
    Widget? child,
    Color? confirmButtonColor,
    bool? showCloseButton,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext dialogContext) {
        return AppPopUp(
          title: title,
          description: description,
          confirmText: confirmText,
          onConfirm: () => onConfirm?.call(dialogContext),
          cancelText: cancelText,
          onCancel: () => onCancel?.call(dialogContext),
          icon: icon,
          actions: actions,
          barrierDismissible: barrierDismissible,
          confirmButtonColor: confirmButtonColor,
          showCloseButton: showCloseButton ?? true,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => barrierDismissible ?? true,
      child: Dialog(
        insetPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: context.theme.appColors.background,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: <Widget>[
                  if (barrierDismissible == false && icon == null && showCloseButton)
                    Padding(
                      padding: const EdgeInsets.only(top: 16, right: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.close),
                        ),
                      ),
                    ),
                  if (icon != null)
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                        ),
                        color: context.theme.appColors.borderColor.withOpacity(0.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 24),
                          icon!,
                          !showCloseButton
                              ? SizedBox(width: 24)
                              : GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: const Icon(
                                    Icons.close,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: <Widget>[
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: context.theme.appTextTheme.title4,
                        ),
                        if (description != null) const SizedBox(height: 8),
                        if (description != null)
                          Text(
                            description!,
                            textAlign: TextAlign.center,
                            style: context.theme.appTextTheme.body2.copyWith(
                              color: context.theme.appColors.textColor.withOpacity(0.6),
                            ),
                          ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    if (child != null) child!,
                    if (confirmText != null && onConfirm != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: AppButton(
                          label: confirmText!,
                          backgroundColor: confirmButtonColor ?? context.theme.appColors.primary,
                          // textColor: Colors.white,
                          onPressed: onConfirm!,
                          isAsync: true,
                        ),
                      ),
                    if (cancelText != null && onCancel != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: AppButton(
                          label: cancelText!,
                          isAsync: true,
                          backgroundColor: ThemeCubit.isDarkMode
                              ? context.theme.appColors.onBackground.withOpacity(0.8)
                              : context.theme.appColors.secondaryBackground,
                          textColor: Colors.black,
                          onPressed: onCancel!,
                        ),
                      ),
                    if (actions != null) const SizedBox(height: 8),
                    if (actions != null) ...actions!,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmPopUp {
  static Future show(
    BuildContext context, {
    required String title,
    String? description,
    String? confirmText,
    dynamic Function(BuildContext cnt)? onConfirm,
    String? cancelText,
    dynamic Function(BuildContext cnt)? onCancel,
    Widget? icon,
    List<Widget>? actions,
    bool? barrierDismissible,
    Widget? child,
  }) async {
    await AppPopUp.show(
      context,
      title: title,
      description: description,
      confirmText: confirmText ?? context.localization.confirm,
      onConfirm: onConfirm,
      cancelText: cancelText ?? context.localization.cancel,
      confirmButtonColor: context.theme.appColors.error,
      onCancel: onCancel ?? (cnt) => Navigator.of(cnt).pop(),
      icon: icon,
      actions: actions,
      barrierDismissible: barrierDismissible ?? true,
      child: child,
    );
  }
}
