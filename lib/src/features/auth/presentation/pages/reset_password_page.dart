import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/forms/app_text_form_field.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/default_layout.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_app_template/src/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordPage extends StatefulWidget {
  static const String routeName = '/reset-password';
  final String email;

  const ResetPasswordPage({super.key, required this.email});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthStatePasswordReset) {
          context.go(LoginPage.routeName);
        }
      },
      buildWhen: (previous, current) => current is AuthStateLoading || current is AuthStateError,
      builder: (context, state) {
        return DefaultLayout(
          title: 'Reset Password',
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Enter your new password',
                    style: context.theme.appTextTheme.body2.copyWith(
                      color: context.theme.appColors.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  AppTextFormField(
                    controller: _passwordController,
                    inputType: InputType.password,
                    label: context.localization.password,
                  ),
                  const SizedBox(height: 16),
                  AppTextFormField(
                    controller: _confirmPasswordController,
                    parentMatchController: _passwordController,
                    inputType: InputType.password,
                    label: context.localization.confirmPassword,
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    onPressed: _resetPassword,
                    isAsync: true,
                    label: 'Reset Password',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _resetPassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      await locator<AuthCubit>().resetPassword(
        widget.email,
        _passwordController.text,
      );
    }
  }
} 