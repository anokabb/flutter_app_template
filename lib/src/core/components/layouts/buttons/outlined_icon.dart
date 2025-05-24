import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';

class OutlinedIcon extends StatefulWidget {
  final IconData icon;
  final Function()? onPressed;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final double? iconSize;
  final double borderWidth;
  final bool isAsync;

  const OutlinedIcon({
    super.key,
    required this.icon,
    this.onPressed,
    this.borderColor,
    this.iconColor,
    this.backgroundColor,
    this.size = 20.0,
    this.iconSize,
    this.borderWidth = 1.0,
    this.isAsync = false,
  });

  @override
  State<OutlinedIcon> createState() => _OutlinedIconState();
}

class _OutlinedIconState extends State<OutlinedIcon> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: !widget.isAsync
            ? widget.onPressed
            : () async {
                if (isLoading) return;
                if (mounted) setState(() => isLoading = true);
                await widget.onPressed?.call();
                if (mounted) setState(() => isLoading = false);
              },
        child: Container(
          height: widget.size * 1.9,
          width: widget.size * 1.9,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.size / 2),
            border: Border.all(
              color: widget.borderColor ?? context.theme.appColors.borderColor.withOpacity(0.5),
              width: widget.borderWidth,
            ),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: (widget.iconSize ?? widget.size) * 0.64,
                    width: (widget.iconSize ?? widget.size) * 0.64,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: widget.iconColor ?? context.theme.appColors.textColor,
                    ),
                  )
                : Icon(
                    widget.icon,
                    color: widget.iconColor,
                    size: widget.iconSize ?? widget.size,
                  ),
          ),
        ),
      ),
    );
  }
}
