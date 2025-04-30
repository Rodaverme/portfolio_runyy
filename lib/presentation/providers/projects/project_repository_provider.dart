import 'package:portfolio_runny/infrastructure/datasources/project_firebase_datasource.dart';
import 'package:portfolio_runny/infrastructure/repositories/project_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

import '../../../domain/entities/projects.dart';

final projectRepositoryProvider = Provider((ref) {
  return ProjectRepositoryImpl(ProjectFirebaseDatasource());
});

final projectBySlugProvider =
    FutureProvider.family<Projects?, String>((ref, slug) async {
  final datasource = ref.read(projectRepositoryProvider);
  return await datasource.getProjectBySlug(slug);
});

final createProjectProvider = FutureProvider.family<void, Projects>((ref, project) async {
  final datasource = ref.read(projectRepositoryProvider);
  await datasource.createProject(project);
  refreshProjectsProvider;
});

final updateProjectProvider = FutureProvider.family<void, Projects>((ref, project) async {
  final datasource = ref.read(projectRepositoryProvider);
  await datasource.updateProject(project);
  refreshProjectsProvider;
});


final projectsListProvider = FutureProvider<List<Projects>>((ref) async {
  final datasource = ref.read(projectRepositoryProvider);
  return await datasource.getProjects();
});

final refreshProjectsProvider = Provider((ref) {
  return () {
    ref.invalidate(projectsListProvider);
  };
});