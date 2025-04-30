import 'package:portfolio_runny/domain/datasources/project_datasource.dart';
import 'package:portfolio_runny/domain/entities/projects.dart';
import 'package:portfolio_runny/domain/repositories/project_repositories.dart';

class ProjectRepositoryImpl extends ProjectRepositories {
  final ProjectDatasource projectDatasource;

  ProjectRepositoryImpl(this.projectDatasource);

  @override
  Future<List<Projects>> getProjects() {
    return projectDatasource.getProjects();
  }
  
  @override
  Future<Projects?> getProjectBySlug(String slug) {
    return projectDatasource.getProjectBySlug(slug);
  }
  
  @override
  Future<void> createProject(Projects project) {
    return projectDatasource.createProject(project);
  }
  
  @override
  Future<void> updateProject(Projects project) {
    return projectDatasource.updateProject(project);
  }

  
}
