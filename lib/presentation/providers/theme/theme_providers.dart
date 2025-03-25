// providers/theme_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppTheme { light, dark }

final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme.dark);

  void toggleTheme() {
    state = state == AppTheme.dark ? AppTheme.light : AppTheme.dark;
  }
}