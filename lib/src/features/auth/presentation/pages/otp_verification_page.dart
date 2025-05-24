import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/components/layouts/buttons/app_button.dart';
import 'package:flutter_app_template/src/core/components/layouts/default_layout.dart';
import 'package:flutter_app_template/src/core/services/locator/locator.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:flutter_app_template/src/core/utils/validator_util.dart';
import 'package:flutter_app_template/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_app_template/src/features/auth/presentation/pages/reset_password_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatefulWidget {
  static const String routeName = '/otp-verification';
  final String email;

  const OtpVerificationPage({super.key, required this.email});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  bool hasError = false;

  final int _otpLength = 6;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthStateOtpVerified) {
          context.push(ResetPasswordPage.routeName, extra: widget.email);
        }
      },
      buildWhen: (previous, current) => current is AuthStateLoading || current is AuthStateError,
      builder: (context, state) {
        return DefaultLayout(
          title: 'OTP Verification',
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Enter the verification code sent to your email',
                    style: context.theme.appTextTheme.body2.copyWith(
                      color: context.theme.appColors.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  PinCodeTextField(
                    appContext: context,
                    length: _otpLength,
                    obscureText: false,
                    validator: (value) => ValidatorUtil.validateOtp(
                      value,
                      context: context,
                      length: _otpLength,
                    ),
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      activeColor: context.theme.appColors.primary,
                      selectedColor: context.theme.appColors.primary,
                      inactiveColor: context.theme.appColors.textColor.withOpacity(0.3),
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    controller: _otpController,
                    onCompleted: (v) {
                      _verifyOtp();
                    },
                    onChanged: (value) {
                      setState(() {
                        hasError = false;
                      });
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    onPressed: _verifyOtp,
                    isAsync: true,
                    label: 'Verify',
                  ),
                  const SizedBox(height: 32),
                  TextButton(
                    onPressed: _resendOtp,
                    child: Text(
                      'Resend Code',
                      style: context.theme.appTextTheme.body2.copyWith(
                        color: context.theme.appColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
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

  Future<void> _verifyOtp() async {
    if (_formKey.currentState?.validate() ?? false) {
      await locator<AuthCubit>().verifyOtp(widget.email, _otpController.text);
    }
  }

  Future<void> _resendOtp() async {
    await locator<AuthCubit>().requestPasswordReset(widget.email);
  }
}
