

import 'package:portfolio_runny/domain/entities/projects.dart';


abstract class ProjectDatasource {
  Future<List<Projects>> getProjects();
  Future<Projects?> getProjectBySlug(String slug);
}