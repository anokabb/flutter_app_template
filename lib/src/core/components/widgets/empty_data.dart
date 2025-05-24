import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';

class EmptyData extends StatelessWidget {
  final String? message;
  const EmptyData({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.block,
            size: 40,
            color: context.theme.appColors.textColor.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          message ?? context.localization.noDataAvailable,
          textAlign: TextAlign.center,
          style: context.theme.appTextTheme.body1.copyWith(
            color: context.theme.appColors.textColor.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
