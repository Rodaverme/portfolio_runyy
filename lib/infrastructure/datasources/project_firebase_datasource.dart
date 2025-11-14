import 'package:dio/dio.dart';

import 'package:portfolio_runny/domain/datasources/project_datasource.dart';
import 'package:portfolio_runny/infrastructure/models/project_response.dart';
import '../../domain/entities/projects.dart';

class ProjectFirebaseDatasource extends ProjectDatasource {
  final Dio dio;

  ProjectFirebaseDatasource()
      : dio = Dio(BaseOptions(
          baseUrl: 'https://myportfolio-76247-default-rtdb.firebaseio.com/',
        ));

  List<Projects> _cache = [];

  @override
  Future<List<Projects>> getProjects() async {
    final response = await dio.get('/projects.json');

    if (response.data == null) {
      _cache = [];
      return [];
    }

    final projectMap = Map<String, dynamic>.from(response.data);

    _cache = projectMap.entries.map((entry) {
      final projectJson = Map<String, dynamic>.from(entry.value);
      final projectResponse = ProjectsResponse.fromJson(projectJson);
      return Projects(
        caracteristicas: projectResponse.caracteristicas,
        imagenesProject: projectResponse.imagenesProject,
        slug: projectResponse.slug,
        descripcion: projectResponse.descripcion,
        imagen: projectResponse.imagen,
        isAndroid: projectResponse.isAndroid,
        isDektop: projectResponse.isDesktop,
        isIos: projectResponse.isIos,
        isWeb: projectResponse.isWeb,
        logo: projectResponse.logo,
        nombre: projectResponse.nombre,
        videoUrl: projectResponse.videoUrl
      );
    }).toList();

    return _cache;
  }

  @override
  Future<Projects?> getProjectBySlug(String slug) async {
    if (_cache.isEmpty) {
      await getProjects();
    }
    return _cache.firstWhere(
      (p) => p.slug == slug,
    );
  }

  @override
  Future<void> createProject(Projects project) async {
    final projectJson = ProjectsResponse(
      caracteristicas: project.caracteristicas,
      imagenesProject: project.imagenesProject,
      slug: project.slug,
      descripcion: project.descripcion,
      imagen: project.imagen,
      isAndroid: project.isAndroid,
      isDesktop: project.isDektop,
      isIos: project.isIos,
      isWeb: project.isWeb,
      logo: project.logo,
      nombre: project.nombre,
    ).toJson();

    await dio.put('/projects/${project.slug}.json', data: projectJson);
    _cache.add(project); // Actualizar el cache
  }

  @override
  Future<void> updateProject(Projects project) async {
    final projectIndex =
        _cache.indexWhere((p) => p.slug == project.slug);
    if (projectIndex == -1) {
      throw Exception('Project with slug ${project.slug} not found');
    }
    final projectJson = ProjectsResponse(
      caracteristicas: project.caracteristicas,
      imagenesProject: project.imagenesProject,
      slug: project.slug,
      descripcion: project.descripcion,
      imagen: project.imagen,
      isAndroid: project.isAndroid,
      isDesktop: project.isDektop,
      isIos: project.isIos,
      isWeb: project.isWeb,
      logo: project.logo,
      nombre: project.nombre,
    ).toJson();

    await dio.put('/projects/${project.slug}.json', data: projectJson);

    // Ensure the cache is updated correctly without duplicating
    _cache[projectIndex] = project;
  }

  @override
  Future<void> deleteProject(String slug) async {
    final projectIndex = _cache.indexWhere((p) => p.slug == slug);
    if (projectIndex == -1) {
      throw Exception('Project with slug $slug not found');
    }

    await dio.delete('/projects/$slug.json');
    _cache.removeAt(projectIndex); // Actualizar el cache
  }


}

  