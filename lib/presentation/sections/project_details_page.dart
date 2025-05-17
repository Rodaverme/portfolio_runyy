// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter/material.dart';
// import 'package:portfolio_runny/presentation/providers/projects/project_repository_provider.dart';
// import 'package:portfolio_runny/presentation/sections/details_project.dart';

// class ProjectDetailsPage extends ConsumerWidget {
//   final String slug;

//   const ProjectDetailsPage({super.key, required this.slug});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final asyncProject = ref.watch(projectBySlugProvider(slug));

//     return asyncProject.when(
//       data: (project) {
//         if (project == null) {
//           return const Scaffold(
//               body: Center(child: Text('Proyecto no encontrado')));
//         }

//         return DetailsProject(project: project,);
//       },
//       loading: () =>
//           const Scaffold(body: Center(child: CircularProgressIndicator())),
//       error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
//     );
//   }
// }
