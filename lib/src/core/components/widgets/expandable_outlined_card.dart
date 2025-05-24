// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/outlined_icon.dart';
import 'package:flutter_app_template/src/core/extensions/extensions.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';

class ExpandableOutlinedCard extends StatefulWidget {
  final Widget title;
  final List<PopupMenuEntry>? actions;
  final Widget child;

  const ExpandableOutlinedCard({
    super.key,
    required this.title,
    required this.child,
    this.actions,
  });

  @override
  State<ExpandableOutlinedCard> createState() => _ExpandableOutlinedCardState();
}

class _ExpandableOutlinedCardState extends State<ExpandableOutlinedCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.appColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.theme.appColors.borderColor,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          /// Top row: Staff name + Expand/Collapse icon
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: widget.title),
                OutlinedIcon(
                  icon: _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  size: 16,
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                ),
                widget.actions == null
                    ? const SizedBox(width: 14)
                    : PopupMenuButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        offset: const Offset(0, 32), // Adjust as desired
                        icon: Icon(
                          Icons.more_vert,
                          color: context.theme.appColors.textColor,
                        ),
                        itemBuilder: (context) => [...widget.actions!],
                        onSelected: (value) {
                          if (value == 'edit') {
                            // Handle edit action
                          } else if (value == 'remove') {
                            // Handle remove action
                          }
                        },
                      ),
              ],
            ),
          ),

          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            child: _isExpanded
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 8),
                    child: Column(
                      children: <Widget>[
                        Divider(endIndent: 14),
                        const SizedBox(height: 16),
                        widget.child,
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ).paddingDirectional(
        ltr: EdgeInsets.fromLTRB(14, 8, 0, 8),
        rtl: EdgeInsets.fromLTRB(0, 8, 14, 8),
      ),
    );
  }
}
