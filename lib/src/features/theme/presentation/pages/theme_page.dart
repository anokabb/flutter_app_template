import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/default_layout.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/extensions/extensions.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/features/theme/presentation/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemePage extends StatefulWidget {
  static const String routeName = '/theme';
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  List<String> themes = [
    'Light',
    'Dark',
    'System',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return DefaultLayout(
          title: context.localization.theme,
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: themes.length + 1,
            itemBuilder: (context, index) {
              if (index == themes.length) {
                return SizedBox();
              }
              return ListTile(
                title: Text(
                  context.localization.getString(themes[index].toLowerCase()).capitalizeFirst,
                  style: context.theme.appTextTheme.body1,
                ),
                onTap: () {
                  locator<ThemeCubit>().changeTheme(index);
                  Future.delayed(
                    const Duration(milliseconds: 300),
                  ).then((_) {
                    setState(() {});
                  });
                  setState(() {});
                },
                trailing: state.selectedTheme == index
                    ? Icon(
                        Icons.check_circle_rounded,
                        color: context.theme.appColors.onBackground,
                      )
                    : null,
              );
            },
          ),
        );
      },
    );
  }
}
