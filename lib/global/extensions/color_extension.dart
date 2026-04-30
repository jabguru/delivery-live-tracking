import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color o(double opacity) {
    return withValues(alpha: opacity / 100);
  }
}
