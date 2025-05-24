import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/extensions/extensions.dart';
import 'package:flutter_app_template/src/core/services/theme/app_colors.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';

import 'dropdown_model.dart';

class AppDropdownMenu extends StatefulWidget {
  final List<DropdownModel> entries;
  final bool isEnabled;
  final double? width;
  final String? initialSelection;
  final String? errorText;
  final TextStyle? textStyle;
  final void Function(String?)? onSelected;
  final bool addAll;
  final String? hint;
  final InputDecorationTheme? inputDecoration;
  final Color? fillColor;
  final String Function(DropdownModel)? customTitle;
  final Color? iconColor;
  final double? height;
  final bool matchWidth;

  const AppDropdownMenu({
    super.key,
    required this.entries,
    this.isEnabled = true,
    this.width,
    this.onSelected,
    this.initialSelection,
    this.errorText,
    this.textStyle,
    this.addAll = false,
    this.hint,
    this.inputDecoration,
    this.fillColor,
    this.customTitle,
    this.iconColor,
    this.height,
    this.matchWidth = true,
  });

  @override
  State<AppDropdownMenu> createState() => _AppDropdownMenuState();
}

class _AppDropdownMenuState extends State<AppDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    // Add "All" option to the entries
    final allOption = DropdownModel(id: 'all', title: 'All');
    final entriesWithAll = widget.addAll ? [allOption, ...widget.entries] : widget.entries;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.fillColor ?? context.theme.appColors.background,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.15),
            //     spreadRadius: 1,
            //     blurRadius: 2,
            //     offset: const Offset(0, 1),
            //   ),
            // ],
            borderRadius: BorderRadius.circular(8),
          ),
          width: widget.width,
          height: widget.height,
          child: DropdownMenu(
            onSelected: (value) {
              if (value == null) {
                widget.onSelected?.call(null);
              } else {
                widget.onSelected?.call(value);
              }
            },
            initialSelection: widget.initialSelection,
            dropdownMenuEntries: entriesWithAll
                .map(
                  (e) => DropdownMenuEntry(
                    value: e.id,
                    label: e.title,
                    labelWidget: widget.customTitle == null
                        ? null
                        : Text(
                            widget.customTitle?.call(e) ?? e.title,
                          ),
                    style: ButtonStyle(
                      textStyle: WidgetStatePropertyAll(context.theme.appTextTheme.body2),
                    ),
                  ),
                )
                .toList(),
            width: widget.matchWidth ? widget.width : null,
            hintText: widget.hint,
            errorText: widget.errorText,
            enabled: widget.isEnabled,
            textStyle: widget.textStyle ?? context.theme.appTextTheme.subtitle2,
            trailingIcon: SizedBox(),
            selectedTrailingIcon: SizedBox(),
            inputDecorationTheme: widget.inputDecoration ??
                InputDecorationTheme(
                  filled: widget.fillColor != null,
                  fillColor: widget.fillColor,
                  hintStyle: context.theme.appTextTheme.body3.copyWith(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: context.theme.appColors.borderColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: context.theme.appColors.borderColor, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  constraints:
                      BoxConstraints(maxHeight: widget.height ?? 50, maxWidth: widget.width ?? double.infinity),
                  contentPadding: const EdgeInsets.only(left: 10, right: 10),
                ),
            menuStyle: MenuStyle(
              backgroundColor: WidgetStatePropertyAll(context.theme.appColors.background),
              surfaceTintColor: WidgetStatePropertyAll(context.theme.appColors.background),
              elevation: const WidgetStatePropertyAll(2),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 8,
          left: 8,
          child: SizedBox(
            height: widget.height,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: widget.isEnabled ? context.theme.appColors.onBackground : context.theme.appColors.borderColor,
            ),
          ).alignDirectional(
            ltr: Alignment.centerRight,
            rtl: Alignment.centerLeft,
          ),
        ),
      ],
    );
  }
}
