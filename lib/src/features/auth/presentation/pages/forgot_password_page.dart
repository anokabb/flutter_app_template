import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/forms/app_text_form_field.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/default_layout.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_app_template/src/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String routeName = '/forgot-password';

  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthStateOtpSent) {
          context.push(OtpVerificationPage.routeName, extra: _emailController.text);
        }
      },
      buildWhen: (previous, current) => current is AuthStateLoading || current is AuthStateError,
      builder: (context, state) {
        return DefaultLayout(
          title: 'Forgot Password',
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Enter your email address to receive a password reset code',
                    style: context.theme.appTextTheme.body2.copyWith(
                      color: context.theme.appColors.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  AppTextFormField(
                    controller: _emailController,
                    inputType: InputType.email,
                    label: context.localization.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    onPressed: _requestPasswordReset,
                    isAsync: true,
                    label: 'Send Reset Code',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _requestPasswordReset() async {
    if (_formKey.currentState?.validate() ?? false) {
      await locator<AuthCubit>().requestPasswordReset(_emailController.text);
    }
  }
} 