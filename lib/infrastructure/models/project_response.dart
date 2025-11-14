import 'dart:convert';

Map<String, ProjectsResponse> projectsResponseFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, ProjectsResponse>(k, ProjectsResponse.fromJson(v)));

String projectsResponseToJson(Map<String, ProjectsResponse> data) =>
    json.encode(
        Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class ProjectsResponse {
  final List<String> imagenesProject;
  final List<String> caracteristicas;
  final String slug;
  final String descripcion;
  final String imagen;
  final bool? isAndroid;
  final bool? isDesktop;
  final bool? isIos;
  final bool? isWeb;
  final String logo;
  final String nombre;
  final String? videoUrl;

  ProjectsResponse({
    required this.caracteristicas,
    required this.imagenesProject,
    required this.slug,
    required this.descripcion,
    required this.imagen,
    this.videoUrl,
    this.isAndroid,
    this.isDesktop,
    this.isIos,
    this.isWeb,
    required this.logo,
    required this.nombre,
  });

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) =>
      ProjectsResponse(
        caracteristicas:
            List<String>.from(json["caracteristicas"].map((x) => x)),
        imagenesProject:
            List<String>.from(json["imagenesProject"].map((x) => x)),
        slug: json["slug"],
        descripcion: json["Descripcion"],
        imagen: json["imagen"],
        isAndroid: json["isAndroid"],
        isDesktop: json["isDesktop"],
        isIos: json["isIos"],
        isWeb: json["isWeb"],
        logo: json["logo"],
        nombre: json["nombre"],
        videoUrl: json["videoUrl"]
      );

  Map<String, dynamic> toJson() => {
        "caracteristicas": List<dynamic>.from(caracteristicas.map((x) => x)),
        "imagenesProject": List<dynamic>.from(imagenesProject.map((x) => x)),
        "slug": slug,
        "Descripcion": descripcion,
        "imagen": imagen,
        "isAndroid": isAndroid,
        "isDesktop": isDesktop,
        "isIos": isIos,
        "isWeb": isWeb,
        "logo": logo,
        "nombre": nombre,
        "videoUrl": videoUrl
      };
}
