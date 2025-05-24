import 'package:flutter/material.dart';

class AppIconButton extends StatefulWidget {
  final Function() onPressed;
  final Widget icon;
  final bool isAsync;
  final bool disabled;
  final double size;
  final Color color;
  final Color? backgroundColor;

  const AppIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.isAsync = false,
    this.disabled = false,
    this.size = 24.0,
    this.color = Colors.white,
    this.backgroundColor,
  });

  @override
  State<AppIconButton> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: widget.size,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      color: widget.color,
      icon: isLoading
          ? SizedBox(
              width: widget.size,
              height: widget.size,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: widget.color,
                ),
              ),
            )
          : widget.icon,
      onPressed: widget.disabled
          ? null
          : widget.isAsync
              ? () async {
                  if (isLoading) return;
                  setState(() => isLoading = true);
                  await widget.onPressed();
                  setState(() => isLoading = false);
                }
              : widget.onPressed,
      disabledColor: widget.color.withOpacity(0.4),
      splashColor: widget.backgroundColor,
    );
  }
}
