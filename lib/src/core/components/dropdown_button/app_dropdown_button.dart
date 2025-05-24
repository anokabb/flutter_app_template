import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';

import 'dropdown_model.dart';

class AppDropdownButton extends StatefulWidget {
  final List<DropdownModel> entries;
  final bool isEnabled;
  final double? width;
  final String? initialSelection;
  final String? errorText;
  final bool? isExpanded;
  final void Function(String?)? onSelected;
  final Widget? icon;

  const AppDropdownButton({
    super.key,
    required this.entries,
    this.isEnabled = true,
    this.width,
    this.onSelected,
    this.initialSelection,
    this.errorText,
    this.isExpanded,
    this.icon,
  });

  @override
  State<AppDropdownButton> createState() => _AppDropdownButtonState();
}

class _AppDropdownButtonState extends State<AppDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(4),
      underline: const SizedBox(),
      padding: EdgeInsets.zero,
      onChanged: widget.onSelected,
      items: widget.entries
          .map(
            (e) => DropdownMenuItem(
                value: e.id,
                child: Text(
                  e.title,
                  style: context.theme.appTextTheme.body2,
                )),
          )
          .toList(),
      isExpanded: widget.isExpanded ?? false,
      isDense: true,
      icon: widget.icon ??
          Icon(
            Icons.more_horiz,
            color: context.theme.appColors.primary,
          ),
    );
  }
}
