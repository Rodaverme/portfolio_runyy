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
      height: 350,
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

// Widget para cada tarjeta con imagen
class _JobCard extends StatelessWidget {
  final Projects project;

  const _JobCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return FadeInLeftBig(
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 400,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(project.imagen),
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/no-image.png',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 10,
            left: 250,
            child: Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  image: NetworkImage(project.logo),
                  fit: BoxFit.fill,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/no-image.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 60,
            child: Container(
              width: 200,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.deepPurple,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Expanded(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.nombre,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            project.descripcion.length > 50
                                ? '${project.descripcion.substring(0, 30)}...'
                                : project.descripcion,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white70,
                                ),
                          )
                        ],
                      ),
                      const SizedBox(width: 5),
                      Wrap(
                        spacing: 5, // Espacio horizontal entre iconos
                        children: [
                          if (project.isDektop == true)
                            const Icon(
                              Icons.desktop_windows_sharp,
                            ),
                          if (project.isAndroid == true)
                            const Icon(Icons.android, color: Colors.green),
                          if (project.isIos == true)
                            const Icon(Icons.apple, color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
