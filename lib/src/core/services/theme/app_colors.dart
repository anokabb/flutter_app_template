import 'package:flutter/material.dart';
import 'package:flutter_app_template/src/core/utils/utils.dart';
import 'package:flutter_app_template/src/features/theme/presentation/cubit/theme_cubit.dart';

abstract class AppColors {
  static const Color black = Color.fromRGBO(18, 18, 18, 1);
  static const Color grey = Color.fromRGBO(244, 244, 244, 1);
  static const Color grey2 = Color.fromRGBO(230, 230, 230, 1);
  static const Color darkGrey = Color.fromRGBO(208, 208, 208, 1);
  static const Color red = Colors.red;
  static const Color green = Color.fromRGBO(0, 200, 83, 1);
  static const Color lightGreen = Color.fromRGBO(206, 244, 197, 1);
  static const Color lightBlue = Color.fromRGBO(87, 177, 251, 1);
  static Color darkBlue = Utils.hexToColor('173481');

  static Color get completedTicketColor => Color.fromRGBO(205, 244, 197, ThemeCubit.isDarkMode ? 0.5 : 1);
  static Color get waitingTicketColor => Color.fromRGBO(190, 230, 255, ThemeCubit.isDarkMode ? 0.5 : 1);
  static Color get noShowTicketTextColor => Color.fromRGBO(230, 230, 230, ThemeCubit.isDarkMode ? 0.5 : 1);
}
