import 'package:flutter/material.dart';

class Utils {
  static Color hexToColor(String hex) {
    String res = hex.replaceAll('#', '');
    return Color(int.parse('0xFF$res'));
  }
}
