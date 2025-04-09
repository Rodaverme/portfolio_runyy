import 'package:flutter/material.dart';
import 'package:portfolio_runny/config/router/app_router.dart';
import 'package:portfolio_runny/config/theme/app_theme.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  static const String name = 'Home - Screen';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Runny',
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
