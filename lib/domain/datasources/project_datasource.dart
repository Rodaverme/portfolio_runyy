

import 'package:portfolio_runny/domain/entities/projects.dart';


abstract class ProjectDatasource {
  Future<List<Projects>> getProjects();
  Future<Projects?> getProjectBySlug(String slug);
  Future<void> createProject(Projects project);
  Future<void> updateProject(Projects project);
  Future<void> deleteProject(String slug);
}