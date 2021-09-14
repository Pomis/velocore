import 'dart:ui';

import 'package:flutter/material.dart';

/// Converts String to Color
/// ex '#6B7AFF' to Color(0xff6B7AFF)
extension ColorExtension on String {
  Color? toColor() {
    var hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    } else {
      return null;
    }
  }
}
