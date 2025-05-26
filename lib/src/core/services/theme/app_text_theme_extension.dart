// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// Small version. Used as an example in lib/app_theme.dart.
class SimpleAppTextThemeExtension extends ThemeExtension<SimpleAppTextThemeExtension> {
  const SimpleAppTextThemeExtension({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.title5,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.subtitle1Light,
    required this.subtitle2Light,
    required this.subtitle3Light,
    required this.body1Light,
    required this.body2Light,
    required this.body3Light,
  });

  /// size 26 | weight bold
  final TextStyle title1;

  /// size 24 | weight bold
  final TextStyle title2;

  /// size 22 | weight bold
  final TextStyle title3;

  /// size 20 | weight bold
  final TextStyle title4;

  /// size 18 | weight bold
  final TextStyle title5;

  /// size 16 | weight bold
  final TextStyle subtitle1;

  /// size 14 | weight bold
  final TextStyle subtitle2;

  /// size 12 | weight bold
  final TextStyle subtitle3;

  /// size 16 | weight normal
  final TextStyle body1;

  /// size 14 | weight normal
  final TextStyle body2;

  /// size 12 | weight normal
  final TextStyle body3;

  /// size 16 | weight bold | color 50% opacity
  final TextStyle subtitle1Light;

  /// size 14 | weight bold | color 50% opacity
  final TextStyle subtitle2Light;

  /// size 12 | weight bold | color 50% opacity
  final TextStyle subtitle3Light;

  /// size 16 | weight normal | color 50% opacity
  final TextStyle body1Light;

  /// size 14 | weight normal | color 50% opacity
  final TextStyle body2Light;

  /// size 12 | weight normal | color 50% opacity
  final TextStyle body3Light;

  @override
  ThemeExtension<SimpleAppTextThemeExtension> copyWith({
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? title3,
    TextStyle? title4,
    TextStyle? title5,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? subtitle3,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? body3,
    TextStyle? subtitle1Light,
    TextStyle? subtitle2Light,
    TextStyle? subtitle3Light,
    TextStyle? body1Light,
    TextStyle? body2Light,
    TextStyle? body3Light,
  }) {
    return SimpleAppTextThemeExtension(
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      title3: title3 ?? this.title3,
      title4: title4 ?? this.title4,
      title5: title5 ?? this.title5,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      subtitle3: subtitle3 ?? this.subtitle3,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      body3: body3 ?? this.body3,
      subtitle1Light: subtitle1Light ?? this.subtitle1Light,
      subtitle2Light: subtitle2Light ?? this.subtitle2Light,
      subtitle3Light: subtitle3Light ?? this.subtitle3Light,
      body1Light: body1Light ?? this.body1Light,
      body2Light: body2Light ?? this.body2Light,
      body3Light: body3Light ?? this.body3Light,
    );
  }

  @override
  ThemeExtension<SimpleAppTextThemeExtension> lerp(
    covariant ThemeExtension<SimpleAppTextThemeExtension>? other,
    double t,
  ) {
    if (other is! SimpleAppTextThemeExtension) {
      return this;
    }

    return SimpleAppTextThemeExtension(
      title1: TextStyle.lerp(title1, other.title1, t)!,
      title2: TextStyle.lerp(title2, other.title2, t)!,
      title3: TextStyle.lerp(title3, other.title3, t)!,
      title4: TextStyle.lerp(title4, other.title4, t)!,
      title5: TextStyle.lerp(title5, other.title5, t)!,
      subtitle1: TextStyle.lerp(subtitle1, other.subtitle1, t)!,
      subtitle2: TextStyle.lerp(subtitle2, other.subtitle2, t)!,
      subtitle3: TextStyle.lerp(subtitle3, other.subtitle3, t)!,
      body1: TextStyle.lerp(body1, other.body1, t)!,
      body2: TextStyle.lerp(body2, other.body2, t)!,
      body3: TextStyle.lerp(body3, other.body3, t)!,
      subtitle1Light: TextStyle.lerp(subtitle1Light, other.subtitle1Light, t)!,
      subtitle2Light: TextStyle.lerp(subtitle2Light, other.subtitle2Light, t)!,
      subtitle3Light: TextStyle.lerp(subtitle3Light, other.subtitle3Light, t)!,
      body1Light: TextStyle.lerp(body1Light, other.body1Light, t)!,
      body2Light: TextStyle.lerp(body2Light, other.body2Light, t)!,
      body3Light: TextStyle.lerp(body3Light, other.body3Light, t)!,
    );
  }
}
