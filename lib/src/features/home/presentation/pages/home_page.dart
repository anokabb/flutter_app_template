// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_button.dart';
import 'package:flutter_app_template/src/core/routing/app_router.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('Home'),
            ),
            AppButton(
              onPressed: () async {
                await locator<AuthCubit>().logout();
                context.go(AppRouter.baseRoute);
              },
              label: 'Logout',
            ),
          ],
        ),
      ),
    );
  }
}
