import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/routing/app_shell.dart';
import 'package:flutter_app_template/src/core/routing/guards/auth_guard.dart';
import 'package:flutter_app_template/src/core/routing/tabs/home_tab.dart';
import 'package:flutter_app_template/src/core/services/logger/logger.dart';
import 'package:flutter_app_template/src/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:flutter_app_template/src/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_app_template/src/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:flutter_app_template/src/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_app_template/src/features/auth/presentation/pages/reset_password_page.dart';
import 'package:flutter_app_template/src/features/dev/presentation/views/dev_mode_view.dart';
import 'package:flutter_app_template/src/features/home/presentation/pages/home_page.dart';
import 'package:flutter_app_template/src/features/languages/presentation/pages/language_page.dart';
import 'package:flutter_app_template/src/features/theme/presentation/pages/theme_page.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  static const String baseRoute = '/';
  static const String defaultRoute = HomePage.routeName;

  final _logger = getLogger('AppRouter');

  GoRouter createRouter() {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: baseRoute,
      redirect: AuthGuard(_logger).redirect,
      routes: [
        _statefulShellRoute(),
        ..._authenticationRoutes(),
        ..._otherRoutes(),
      ],
    );
  }

  StatefulShellRoute _statefulShellRoute() {
    return StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => AppShell(navigationShell: navigationShell),
      branches: [
        homeTabBranch,
      ],
    );
  }

  List<GoRoute> _authenticationRoutes() {
    return [
      GoRoute(
        path: LoginPage.routeName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: RegisterPage.routeName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const RegisterPage(),
        ),
      ),
      GoRoute(
        path: ForgotPasswordPage.routeName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ForgotPasswordPage(),
        ),
      ),
      GoRoute(
        path: OtpVerificationPage.routeName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: OtpVerificationPage(email: state.extra as String),
        ),
      ),
      GoRoute(
        path: ResetPasswordPage.routeName,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: ResetPasswordPage(email: state.extra as String),
        ),
      ),
    ];
  }

  List<GoRoute> _otherRoutes() {
    return [
      GoRoute(
        path: DevModeView.routeName,
        pageBuilder: (context, state) => CupertinoPage(child: DevModeView()),
      ),
      GoRoute(
        path: ThemePage.routeName,
        pageBuilder: (context, state) => CupertinoPage(child: ThemePage()),
      ),
      GoRoute(
        path: LanguagePage.routeName,
        pageBuilder: (context, state) => CupertinoPage(child: LanguagePage()),
      ),
    ];
  }
}
