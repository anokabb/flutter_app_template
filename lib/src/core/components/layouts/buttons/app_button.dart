import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';

class AppButton extends StatefulWidget {
  final String? label;
  final Function() onPressed;
  final Function()? onDisabledPressed;
  final Widget? icon;
  final bool isAsync;
  final bool disabled;
  // final bool isExpanded;
  final EdgeInsetsGeometry? padding;
  final double height;
  final double? width;
  final double borderRadius;
  final Color? textColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final bool isTextButton;
  final Alignment? alignment;
  final BorderSide borderSide;
  final double? elevation;
  final bool autoResize;
  final Widget? customChild; // Add customChild property
  final bool isOutlined;
  final bool ignoreHeight;
  final TextAlign? textAlign;

  const AppButton({
    super.key,
    this.label,
    required this.onPressed,
    this.onDisabledPressed,
    // this.isExpanded = true,
    this.disabled = false,
    this.autoResize = false,
    this.icon,
    this.borderRadius = 500,
    this.textStyle,
    this.textColor,
    this.backgroundColor,
    this.isAsync = false,
    this.padding,
    this.height = 48,
    this.width,
    this.alignment,
    this.isTextButton = false,
    this.borderSide = BorderSide.none,
    this.elevation,
    this.customChild, // Initialize customChild
    this.isOutlined = false,
    this.ignoreHeight = false,
    this.textAlign,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isLoading = false;

  late final Color textColor = widget.textColor ?? context.theme.appColors.onPrimary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.ignoreHeight ? null : widget.height,
      child: widget.icon == null ? (widget.isTextButton ? _buildTextButton() : _buildButton()) : _buildIconButton(),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      style: _raisedButtonStyle(),
      onPressed: widget.disabled
          ? widget.onDisabledPressed
          : widget.isAsync
              ? () async {
                  if (isLoading) return;
                  if (mounted) setState(() => isLoading = true);
                  await widget.onPressed();
                  if (mounted) setState(() => isLoading = false);
                }
              : widget.onPressed,
      child: isLoading
          ? _CircularProgressIndicator(
              height: widget.height,
              color: textColor,
            )
          : _buttonContent(),
    );
  }

  Widget _buildTextButton() {
    return TextButton(
      style: TextButton.styleFrom(
        padding: widget.padding,
        alignment: widget.alignment,
        textStyle: widget.textStyle ??
            context.theme.appTextTheme.subtitle3.copyWith(
              color: textColor,
            ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
      onPressed: widget.disabled
          ? widget.onDisabledPressed
          : widget.isAsync
              ? () async {
                  if (isLoading) return;
                  setState(() => isLoading = true);
                  await widget.onPressed();
                  setState(() => isLoading = false);
                }
              : widget.onPressed,
      child: isLoading
          ? _CircularProgressIndicator(
              height: widget.height,
              color: textColor,
            )
          : _buttonContent(),
    );
  }

  Widget _buildIconButton() {
    return ElevatedButton.icon(
      icon: isLoading ? null : widget.icon!,
      style: _raisedButtonStyle(),
      label: isLoading
          ? Center(
              child: _CircularProgressIndicator(
                height: widget.height,
                color: textColor,
              ),
            )
          : _buttonContent(),
      onPressed: widget.disabled
          ? widget.onDisabledPressed
          : widget.isAsync
              ? () async {
                  if (isLoading) return;
                  setState(() => isLoading = true);
                  await widget.onPressed();
                  setState(() => isLoading = false);
                }
              : widget.onPressed,
    );
  }

  ButtonStyle _raisedButtonStyle() {
    return ElevatedButton.styleFrom(
      alignment: widget.alignment ?? Alignment.center,
      surfaceTintColor: widget.backgroundColor,
      disabledBackgroundColor: widget.backgroundColor,
      backgroundColor: widget.isOutlined
          ? context.theme.appColors.background
          : (widget.backgroundColor ?? context.theme.appColors.primary),
      padding: widget.padding,
      elevation: widget.isOutlined ? 0 : widget.elevation,
      foregroundColor: textColor,
      textStyle: widget.textStyle ??
          context.theme.appTextTheme.subtitle3.copyWith(
            color: textColor,
          ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        side: widget.isOutlined
            ? (widget.borderSide == BorderSide.none
                ? BorderSide(
                    color: textColor ?? context.theme.appColors.borderColor,
                    width: 2,
                  )
                : widget.borderSide)
            : widget.borderSide,
      ),
    );
  }

  Widget _buttonContent() {
    if (widget.customChild != null) {
      return widget.customChild!;
    }
    return widget.autoResize
        ? AutoSizeText(
            widget.label ?? '',
            maxLines: 1,
            textAlign: widget.textAlign ?? TextAlign.center,
            style: widget.textStyle ??
                context.theme.appTextTheme.subtitle3.copyWith(
                  color: textColor,
                ),
          )
        : Text(
            widget.label ?? '',
            textAlign: widget.textAlign ?? TextAlign.center,
            style: widget.textStyle ??
                context.theme.appTextTheme.subtitle3.copyWith(
                  color: textColor,
                ),
          );
  }
}

class _CircularProgressIndicator extends StatelessWidget {
  final double height;
  final Color? color;

  const _CircularProgressIndicator({required this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.4,
      width: height * 0.4,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: color ?? context.theme.appColors.textColor,
      ),
    );
  }
}
