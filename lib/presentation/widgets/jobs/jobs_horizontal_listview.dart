import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:portfolio_runny/domain/entities/projects.dart';

class JobsHorizontalListview extends StatelessWidget {
  final List<Projects> projects;

  JobsHorizontalListview({super.key, required this.projects});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MouseRegion(
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            scrollController.jumpTo(scrollController.offset - details.delta.dx);
          },
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return _JobCard(project: project);
            },
          ),
        ),
      ),
    );
  }
}

class _JobCard extends StatelessWidget {
  final Projects project;
  const _JobCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return FadeInLeftBig(
      child: SizedBox(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Card(
            borderOnForeground: true,
            child: Stack(children: [
              Container(
                width: 450,
                height: 450,
                color: Colors.green,
                child: FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  image: NetworkImage(project.imagen),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 270,
                child: Container(
                  height: 120,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft:
                          Radius.circular(20), // Ajusta el valor a tu gusto
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    ),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/loading.gif'),
                      image: NetworkImage(project.logo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 380,
                  child: Container(
                    height: 80,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        Text(
                          project.nombre,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          project.descripcion.length > 50
                              ? '${project.descripcion.substring(0, 50)}...'
                              : project.descripcion,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white70,
                                  ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ))
            ])),
      )),
    );
  }
}












// Widget para cada tarjeta con imagen
// class _JobCard extends StatelessWidget {
//   final Projects project;

//   const _JobCard({required this.project});

//   @override
//   Widget build(BuildContext context) {
//     return FadeInLeftBig(
//       child: Container(
//         width: 400,
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black26,
//               blurRadius: 5,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             // Imagen con logo encima
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius:
//                       const BorderRadius.vertical(top: Radius.circular(10)),
//                   child: SizedBox(
//                     height: 537,
//                     width: double.infinity,
//                     child: FadeInImage(
//                       placeholder: const AssetImage('assets/loading.gif'),
//                       image: NetworkImage(project.imagen),
//                       fit: BoxFit.cover,
//                       imageErrorBuilder: (_, __, ___) => Image.asset(
//                         'assets/no-image.png',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Logo en la esquina superior derecha
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 4,
//                           offset: Offset(2, 2),
//                         ),
//                       ],
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: FadeInImage(
//                         placeholder: const AssetImage('assets/loading.gif'),
//                         image: NetworkImage(project.logo),
//                         fit: BoxFit.contain,
//                         imageErrorBuilder: (_, __, ___) =>
//                             Image.asset('assets/no-image.png'),
//                       ),
//                     ),
//                   ),
//                 ),

//                 Positioned(
//                   bottom: 1,
//                   child: Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: const BoxDecoration(
//                       color: Colors.deepPurple,
//                       borderRadius:
//                           BorderRadius.vertical(bottom: Radius.circular(10)),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Textos
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               project.nombre,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .titleLarge
//                                   ?.copyWith(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               project.descripcion.length > 50
//                                   ? '${project.descripcion.substring(0, 50)}...'
//                                   : project.descripcion,
//                               style:
//                                   Theme.of(context).textTheme.bodySmall?.copyWith(
//                                         color: Colors.white70,
//                                       ),
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(width: 8),
//                         // Iconos de plataforma
//                         Wrap(
//                           spacing: 4,
//                           children: [
//                             if (project.isDektop == true)
//                               const Icon(Icons.desktop_windows_sharp,
//                                   color: Colors.white),
//                             if (project.isAndroid == true)
//                               const Icon(Icons.android,
//                                   color: Colors.greenAccent),
//                             if (project.isIos == true)
//                               const Icon(Icons.apple, color: Colors.white),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),

//             // Texto y plataformas
//           ],
//         ),
//       ),
//     );
  

