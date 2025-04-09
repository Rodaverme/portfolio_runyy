import 'package:dio/dio.dart';
import 'package:portfolio_runny/domain/datasources/project_datasource.dart';
import 'package:portfolio_runny/infrastructure/models/project_response.dart';
import '../../domain/entities/projects.dart';

class ProjectFirebaseDatasource extends ProjectDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://myportfolio-76247-default-rtdb.firebaseio.com/',
  ));

  @override
  Future<List<Projects>> getProjects() async {
    final response = await dio.get('/projects.json');

    if (response.data == null) {
      return []; // Si no hay datos, devolver una lista vacía
    }

    // Firebase devuelve un mapa de proyectos, necesitamos convertirlo en una lista
    final Map<String, dynamic> projectMap = response.data as Map<String, dynamic>;
    
    List<Projects> projects = projectMap.entries.map((entry) {
      final projectJson = entry.value as Map<String, dynamic>;
      final projectResponse = ProjectsResponse.fromJson(projectJson);
      return Projects(
        descripcion: projectResponse.descripcion,
        imagen: projectResponse.imagen,
        isAndroid: projectResponse.isAndroid,
        isDektop: projectResponse.isDesktop, // ¡Asegúrate de corregir el nombre aquí!
        isIos: projectResponse.isIos,
        isWeb: projectResponse.isWeb,
        logo: projectResponse.logo,
        nombre: projectResponse.nombre,
      );
    }).toList();

    return projects;
  }
}
