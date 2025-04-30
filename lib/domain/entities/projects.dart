class Projects {
  
  late final String slug;
  final List<String> caracteristicas;
  final List<String> imagenesProject;
  final String descripcion;
  final String imagen;
  final bool? isAndroid;
  final bool? isDektop;
  final bool? isIos;
  final bool? isWeb;
  final String logo;
  final String nombre;
  

  Projects({
    required this.imagenesProject,
    required this.caracteristicas,
    required this.slug,
    required this.descripcion,
    required this.imagen,
    this.isAndroid,
    this.isDektop,
    this.isIos,
    this.isWeb,
    required this.logo,
    required this.nombre,
  });
}
