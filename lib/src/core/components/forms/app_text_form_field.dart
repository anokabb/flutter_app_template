import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_template/src/core/components/widgets/rtl_wraper.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';
import 'package:flutter_app_template/src/core/services/theme/app_colors.dart';
import 'package:flutter_app_template/src/core/services/theme/app_theme.dart';
import 'package:validators/validators.dart' as validator;

enum InputType { email, password, phone, number, text, postalCode, price }

class AppTextFormField extends StatefulWidget {
  final FormFieldSetter<String>? onSaved;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? label;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextEditingController? parentMatchController;
  final InputType inputType;
  final Widget? prefixIcon;
  final InputBorder? border;
  final Color? backgroundColor;
  final bool autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final bool validatePasswordFormat;
  final bool ignoreValidation;
  final bool readOnly;
  final double? height;
  final bool showErrorMessage;
  final bool isMultiline;
  final bool isDigitsOnly;
  final String? Function(String?)? validator;
  final String? hintText;
  final int? maxLines;
  final String? initialValue;

  const AppTextFormField({
    super.key,
    this.onSaved,
    this.onFieldSubmitted,
    this.controller,
    this.inputType = InputType.text,
    this.label,
    this.focusNode,
    this.onChanged,
    this.parentMatchController,
    this.prefixIcon,
    this.backgroundColor,
    this.border,
    this.autofocus = false,
    this.contentPadding,
    this.validatePasswordFormat = false,
    this.ignoreValidation = false,
    this.readOnly = false,
    this.height,
    this.showErrorMessage = true,
    this.isMultiline = false,
    this.validator,
    this.isDigitsOnly = false,
    this.hintText,
    this.maxLines,
    this.initialValue,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _showPassword = false;
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  late final TextEditingController persistController = TextEditingController(text: widget.initialValue);

  @override
  void dispose() {
    persistController.dispose();

    super.dispose();
  }

  TextInputType _getKeyboardType() {
    switch (widget.inputType) {
      case InputType.email:
        return TextInputType.emailAddress;
      case InputType.password:
        return TextInputType.visiblePassword;
      case InputType.phone:
        return TextInputType.phone;
      case InputType.number:
        return TextInputType.number;
      case InputType.text:
        return TextInputType.text;
      case InputType.price:
        return TextInputType.numberWithOptions(decimal: true);
      default:
        return TextInputType.text;
    }
  }

  String? _validateInput(String? value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _autoValidate = AutovalidateMode.onUserInteraction;
        });
      }
    });

    if (value == null) return context.localization.thisFieldIsRequired;

    switch (widget.inputType) {
      case InputType.email:
        return validator.isEmail(value) ? null : context.localization.enterAValidEmail;
      case InputType.password:
        // Check if passwords match (if parent match controller is provided)
        if (widget.parentMatchController != null && value != widget.parentMatchController!.text) {
          return context.localization.passwordsDoNotMatch;
        }

        // Check if length is less than 8
        if (value.length < 8) {
          return context.localization.passwordMustBeAtLeast8Characters;
        }

        // Check if password format validation is disabled
        if (!widget.validatePasswordFormat) {
          return null;
        }

        // Check if contains at least one uppercase letter
        if (!RegExp(r'[A-Z]').hasMatch(value)) {
          return context.localization.passwordMustContainAtLeastOneUppercaseLetter;
        }

        // Check if contains at least one lowercase letter
        if (!RegExp(r'[a-z]').hasMatch(value)) {
          return context.localization.passwordMustContainAtLeastOneLowercaseLetter;
        }

        // Check if contains at least one number or special character
        if (!RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
          return context.localization.passwordMustContainAtLeastOneNumberOrSpecialCharacter;
        }

      // If all checks pass, return null (no error)

      case InputType.phone:
        if (!RegExp(r'^-?[0-9.]+$').hasMatch(value) || value.length < 10) {
          return context.localization.pleaseEnterAValidCellphoneNumber;
        }
      case InputType.number:
        if (!RegExp(r'^-?[0-9.]+$').hasMatch(value)) {
          return context.localization.pleaseEnterAValidNumber;
        }

      case InputType.text:
        return value.trim().isNotEmpty ? null : context.localization.thisFieldIsRequired;
      case InputType.postalCode:
        if (value.trim().isEmpty) {
          return context.localization.thisFieldIsRequired;
        }
        // regex to check if postal code is in 4-5 digit format
        if (!RegExp(r'^[0-9]{4,5}$').hasMatch(value)) {
          return context.localization.enterAValidPostalCode;
        }
      case InputType.price:
        if (value.trim().isEmpty) {
          return context.localization.thisFieldIsRequired;
        }
        // regex to check if price is in 0.00 format
        if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value)) {
          return context.localization.enterAValidPrice;
        }
        break;
      default:
        return null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: RTLWrapper(
              rtlChild: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.label!,
                  style: context.theme.appTextTheme.subtitle2,
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.label!,
                  style: context.theme.appTextTheme.subtitle2,
                ),
              ),
            ),
          ),
        TextFormField(
          readOnly: widget.readOnly,
          focusNode: widget.focusNode,
          controller: widget.initialValue != null ? persistController : widget.controller,
          textCapitalization: TextCapitalization.none,
          autocorrect: false,
          autofocus: widget.autofocus,
          enableSuggestions: false,
          keyboardType: _getKeyboardType(),
          textInputAction: TextInputAction.next,
          onFieldSubmitted: widget.onFieldSubmitted,
          obscureText: widget.inputType == InputType.password && _showPassword == false,
          obscuringCharacter: '*',
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines ?? (widget.isMultiline ? 3 : 1),
          autovalidateMode: _autoValidate,
          autofillHints: widget.inputType == InputType.email
              ? const [AutofillHints.email]
              : widget.inputType == InputType.password
                  ? const [AutofillHints.password]
                  : null,
          validator: widget.validator ??
              (value) {
                if (widget.ignoreValidation) return null;
                return _validateInput(value);
              },
          inputFormatters: widget.isDigitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: context.theme.appColors.textColor.withOpacity(0.5),
              fontStyle: FontStyle.italic,
            ),
            border: widget.border ?? context.theme.inputDecorationTheme.border,
            enabledBorder: widget.border ?? context.theme.inputDecorationTheme.border,
            focusedBorder: widget.border ?? context.theme.inputDecorationTheme.focusedBorder,
            errorBorder: widget.border?.copyWith(borderSide: const BorderSide(color: AppColors.red)) ??
                context.theme.inputDecorationTheme.border,
            errorStyle: TextStyle(fontSize: widget.showErrorMessage ? null : 0),
            fillColor: widget.backgroundColor,
            filled: widget.backgroundColor != null,
            contentPadding: widget.contentPadding ?? const EdgeInsets.all(16.0),
            // constraints: widget.isMultiline ? null : BoxConstraints(maxHeight: widget.height ?? 50),
            // labelText: widget.label,
            // labelStyle: const TextStyle(
            //   color: Colors.grey,
            // ),

            prefixIcon: widget.prefixIcon == null
                ? null
                : UnconstrainedBox(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: widget.prefixIcon,
                    ),
                  ),
            suffixIcon: widget.inputType == InputType.password
                ? IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                      color: context.theme.appColors.borderColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
