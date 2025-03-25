import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/core/di/injection_container.dart';
import 'package:movies_app/core/router/app_router.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/presentation/providers/theme/theme_providers.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      themeMode: theme == AppTheme.dark ? ThemeMode.dark : ThemeMode.light,
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: LightColors.surface,
      colorScheme: ColorScheme.light(
        primary: LightColors.primary,
        secondary: LightColors.secondary,
        surface: LightColors.surface,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: LightColors.surface,
        elevation: 1,
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DarkColors.surface,
      colorScheme:  ColorScheme.dark(
        primary: DarkColors.primary,
        secondary: DarkColors.secondary,
        surface: DarkColors.surface,
        error: AppColors.error,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: DarkColors.surface,
        elevation: 1,
      ),
    );
  }
}
