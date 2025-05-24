import 'package:flutter/widgets.dart';
import 'package:flutter_app_template/src/core/extensions/context_extension.dart';

class ValidatorUtil {
  static String? validateNotEmptyString(String? val, {String msg = 'Please enter a value'}) {
    if ((val ?? '').trim().isEmpty) {
      return msg;
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email address required";
    }

    // when validating, trim first so that trailing spaces are allowed.
    email = email.trim();

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    return !regex.hasMatch(email) ? 'Invalid email' : null;
  }

  static String? validatePassword(String? password) {
    if (password == null) return "Password required";
    return password.length < 6 ? 'Password must be at least 6 characters' : null;
  }

  static String? validateNumber(String? val, bool isRequired, {int? min}) {
    if (val == null || val.isEmpty) {
      return isRequired ? "Number is required" : null;
    }
    if (!RegExp(r'^-?[0-9.]+$').hasMatch(val)) {
      return 'Please enter a valid number';
    }
    if (min != null && int.parse(val) < min) {
      return 'Please enter a number greater than $min';
    }
    return null;
  }

  static String? validateCreditCard(String? val, bool isRequired) {
    if (val == null || val.isEmpty) {
      return isRequired ? "Credit card number required" : null;
    }

    if (!RegExp(r'^-?[0-9 ]+$').hasMatch(val) || val.length != 19) {
      return 'Please enter a valid credit card';
    }
    return null;
  }

  static String? validateExpiryDate(String? val, bool isRequired) {
    if (val == null || val.isEmpty) {
      return isRequired ? "Valid expiry data is required" : null;
    }

    if (!RegExp(r'^-?[0-9/]+$').hasMatch(val) || val.length != 5) {
      return 'Please enter a valid expiry date';
    }
    return null;
  }

  static String? validateCvv(String? val, bool isRequired) {
    if (val == null || val.isEmpty) {
      return isRequired ? "Valid CVV number required" : null;
    }

    if (!RegExp(r'^-?[0-9]+$').hasMatch(val) || val.length != 3) {
      return 'Please enter a valid 3 digit CVV';
    }
    return null;
  }

  static String? validateCellphone(String? val, bool isRequired) {
    if (val == null || val.isEmpty) {
      return isRequired ? "Cellphone number required" : null;
    }
    // if (val.startsWith('+') == false) {
    //   return 'Number must begin with a +';
    // }
    if (!RegExp(r'^-?[0-9.]+$').hasMatch(val) || val.length != 10) {
      return 'Please enter a valid cellphone number';
    }
    return null;
  }

  /// incomplete validation. It's not using the control digit.
  static String? validateSAIDnumber(String? val, {String msg = 'Invalid SA ID number'}) {
    if (val == null || val.isEmpty) {
      return msg;
    }
    bool onlyDigits = RegExp(r'^[0-9]+$').hasMatch(val);
    var valid = onlyDigits && val.length == 13;
    if (!valid) {
      return msg;
    }

    // Extract parts of the ID
    var mm = int.parse(val.substring(2, 4));
    var dd = int.parse(val.substring(4, 6));
    var gender = int.parse(val.substring(6, 7));
    var citizenship = int.parse(val.substring(10, 11));

    // Check date of birth
    if (mm < 1 || mm > 12 || dd < 1 || dd > 31) {
      return msg;
    }

    // Check gender
    if (gender < 0 || gender > 9) {
      return msg;
    }

    // Check citizenship
    if (citizenship != 0 && citizenship != 1) {
      return msg;
    }

    // Check control digit
    // buggy, chat GPT can't get that right. Let's ignore control digit?
    // var idNumber = val.split('').map((s) => int.parse(s)).toList();
    // var evenPosSum = idNumber
    //     .asMap()
    //     .entries
    //     .where((entry) => entry.key % 2 == 0)
    //     .map((entry) => entry.value * 2)
    //     .map((num) => num > 9 ? num - 9 : num)
    //     .reduce((a, b) => a + b);
    // var oddPosSum = idNumber
    //     .asMap()
    //     .entries
    //     .where((entry) => entry.key % 2 != 0 && entry.key < 12)
    //     .map((entry) => entry.value)
    //     .reduce((a, b) => a + b);
    // var total = oddPosSum + evenPosSum;
    // var controlCheck = total % 10 == 0 ? 0 : 10 - (total % 10);
    // if (controlCheck != control) {
    //   return msg;
    // }

    return null;
  }

  static String? validateOtp(String? val, {required int length, required BuildContext context}) {
    if (val == null || val.isEmpty) {
      return context.localization.pleaseEnterTheVerificationCode;
    }
    if (val.length != length) {
      return context.localization.pleaseEnterAValidOtp;
    }
    return null;
  }
}
