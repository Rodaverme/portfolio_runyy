import 'dart:convert';

Map<String, ProjectsResponse> projectsResponseFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) =>
        MapEntry<String, ProjectsResponse>(k, ProjectsResponse.fromJson(v)));

String projectsResponseToJson(Map<String, ProjectsResponse> data) =>
    json.encode(
        Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class ProjectsResponse {
  final String slug;
  final String descripcion;
  final String imagen;
  final bool? isAndroid;
  final bool? isDesktop;
  final bool? isIos;
  final bool? isWeb;
  final String logo;
  final String nombre;

  ProjectsResponse({
    required this.slug,
    required this.descripcion,
    required this.imagen,
    this.isAndroid,
    this.isDesktop,
    this.isIos,
    this.isWeb,
    required this.logo,
    required this.nombre,
  });

  factory ProjectsResponse.fromJson(Map<String, dynamic> json) =>
      ProjectsResponse(
        slug: json["slug"],
        descripcion: json["Descripcion"],
        imagen: json["imagen"],
        isAndroid: json["isAndroid"],
        isDesktop: json["isDesktop"],
        isIos: json["isIos"],
        isWeb: json["isWeb"],
        logo: json["logo"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "Descripcion": descripcion,
        "imagen": imagen,
        "isAndroid": isAndroid,
        "isDesktop": isDesktop,
        "isIos": isIos,
        "isWeb": isWeb,
        "logo": logo,
        "nombre": nombre,
      };
}
