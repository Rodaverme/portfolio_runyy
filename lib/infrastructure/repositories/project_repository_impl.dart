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
}
