import 'package:go_router/go_router.dart';
import 'package:portfolio_runny/presentation/admin/login_screen_admin.dart';

import 'package:portfolio_runny/presentation/sections/project_details_page.dart';

import '../../presentation/admin/home_screen_admin.dart';
import '../../presentation/sections/home_Screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(currentPath: '/'),
    ),
    GoRoute(
      path: '/aboutme',
      builder: (context, state) => HomeScreen(currentPath: '/aboutme'),
    ),
    GoRoute(
      path: '/services',
      builder: (context, state) => HomeScreen(currentPath: '/services'),
    ),
    GoRoute(
      path: '/works',
      builder: (context, state) => HomeScreen(currentPath: '/works'),
    ),
    GoRoute(
      path: '/details/:slug',
      name: 'project-details',
      builder: (context, state) {
        final slug = state.pathParameters['slug']!;
        return ProjectDetailsPage(
          slug: slug,
        ); // 👈 Aquí usas tu ConsumerWidget
      },
    ),
    GoRoute(
        path: '/contact',
        builder: (context, state) => HomeScreen(currentPath: '/contact')),
    GoRoute(path: '/admin', builder: (context, state) => LoginScreenAdmin()),
    GoRoute(path: '/admin/home', builder: (context, state) => HomeScreenAdmin()),
  ],
);
