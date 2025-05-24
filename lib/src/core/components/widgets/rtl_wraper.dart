import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/features/languages/presentation/cubit/language_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RTLWrapper extends StatelessWidget {
  final Widget child;
  final Widget rtlChild;

  const RTLWrapper({super.key, required this.child, required this.rtlChild});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale?>(
      builder: (context, locale) {
        bool isRTL = locale?.languageCode == 'ar';
        if (isRTL) {
          return rtlChild;
        }
        return child;
      },
    );
  }
}
