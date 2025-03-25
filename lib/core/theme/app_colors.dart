// themes/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // 🎨 Semánticos
  static const Color error = Color(0xFFFF3B6C);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);

  // 🎬 Tema Oscuro
  static const DarkColors dark = DarkColors();

  // 🎥 Tema Claro
  static const LightColors light = LightColors();
}

class DarkColors {
  const DarkColors();

  static const Color primary = Color(0xFFFF9100);
  static const Color secondary = Color(0xFF212121);
  static const Color surface = Color(0xFF121212);
  static const Color onSurface = Color(0xFFE0E0E0);
  static const Color onSecondary = Color(0xFFBDBDBD);
}

class LightColors {
  const LightColors();

  static const Color primary = Color(0xFFFF6D00);
  static const Color secondary = Color(0xFF1E1E1E);
  static const Color surface = Color(0xFFF5F5F5);
  static const Color onSurface = Color(0xFF212121);
  static const Color onSecondary = Color(0xFF424242);
}
