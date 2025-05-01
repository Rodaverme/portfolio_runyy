import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:portfolio_runny/config/router/app_router.dart';
import 'package:portfolio_runny/config/theme/app_theme.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/providers/projects/theme_provider.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  static const String name = 'Home - Screen';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Runny',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: appRouter,
    );
  }
}
