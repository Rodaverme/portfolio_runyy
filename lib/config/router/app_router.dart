

import 'package:go_router/go_router.dart';

import '../../presentation/sections/home_Screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', name: 'home',  builder: (context, state) => HomeScreen()),
  ],
);