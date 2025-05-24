import 'package:flutter/cupertino.dart';
import 'package:flutter_app_template/src/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final homeTabBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      path: HomePage.routeName,
      pageBuilder: (context, state) => const CupertinoPage(child: HomePage()),
      routes: [
      ],
    ),
  ],
);
