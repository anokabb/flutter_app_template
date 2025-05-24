import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';

class AppCheckBox extends StatelessWidget {
  final bool? value;
  final Widget? label;
  final void Function() onTap;

  const AppCheckBox({
    super.key,
    required this.onTap,
    required this.value,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: (value) {
              onTap();
            },
            side: BorderSide(
              color: context.theme.appColors.borderColor,
              width: 1.5,
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: context.theme.appColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          if (label != null) Expanded(child: label!),
        ],
      ),
    );
  }
}
