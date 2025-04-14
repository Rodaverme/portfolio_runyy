import 'package:dio/dio.dart';

import 'package:portfolio_runny/domain/datasources/project_datasource.dart';
import 'package:portfolio_runny/infrastructure/models/project_response.dart';
import '../../domain/entities/projects.dart';

class ProjectFirebaseDatasource extends ProjectDatasource {
  final dio = Dio(BaseOptions(
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

    final Map<String, dynamic> projectMap =
        response.data as Map<String, dynamic>;

    _cache = projectMap.entries.map((entry) {
      final projectJson = entry.value as Map<String, dynamic>;
      final projectResponse = ProjectsResponse.fromJson(projectJson);
      return Projects(
        slug: projectResponse.slug,
        descripcion: projectResponse.descripcion,
        imagen: projectResponse.imagen,
        isAndroid: projectResponse.isAndroid,
        isDektop: projectResponse.isDesktop,
        isIos: projectResponse.isIos,
        isWeb: projectResponse.isWeb,
        logo: projectResponse.logo,
        nombre: projectResponse.nombre,
      );
    }).toList();

    return _cache;
  }

  @override
  Future<Projects?> getProjectBySlug(String slug) async {
    if (_cache.isEmpty) {
      await getProjects(); // Llenar el cache si está vacío
    }
    try {
      return _cache.firstWhere((p) => p.slug == slug);
    } catch (_) {
      return null;
    }
  }
}


