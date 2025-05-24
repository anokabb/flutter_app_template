import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/forms/app_text_form_field.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/default_layout.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/routing/app_router.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_app_template/src/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:flutter_app_template/src/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthStateAuthenticated) {
          context.go(AppRouter.baseRoute);
        } else if (state is AuthStateError) {
          showTopError(state.error.message);
        }
      },
      buildWhen: (previous, current) => current is AuthStateLoading || current is AuthStateError,
      builder: (context, state) {
        return DefaultLayout(
          title: context.localization.login,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppTextFormField(
                    controller: _emailController,
                    inputType: InputType.email,
                    label: context.localization.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  AppTextFormField(
                    controller: _passwordController,
                    inputType: InputType.password,
                    label: context.localization.password,
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.push(ForgotPasswordPage.routeName),
                      child: Text(
                        context.localization.forgotPassword,
                        style: context.theme.appTextTheme.body2.copyWith(
                          color: context.theme.appColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    onPressed: _login,
                    isAsync: true,
                    label: context.localization.login,
                  ),
                  const SizedBox(height: 48),
                  RichText(
                    text: TextSpan(
                      style: context.theme.appTextTheme.body2.copyWith(
                        color: context.theme.appColors.textColor,
                      ),
                      children: [
                        TextSpan(text: '${context.localization.donTHaveAnAccount} '),
                        TextSpan(
                          text: context.localization.signUp,
                          style: TextStyle(
                            color: context.theme.appColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () => context.push(RegisterPage.routeName),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      await locator<AuthCubit>().login(_emailController.text, _passwordController.text);
    }
  }
}
