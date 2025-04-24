import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/projects.dart';

class DetailsProject extends StatelessWidget {
  final Projects project;

  const DetailsProject({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> tecnologias = [
      "Flutter",
      "Dart",
      "Isar DB",
    ];

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(project: project),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project.descripcion,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(project.caracteristicas[0]),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CarruselImages(project: project),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Text(
                            "Tecnologias utilizadas",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            children: tecnologias
                                .map((e) => Chip(
                                      label: Text(e),
                                      backgroundColor: Colors.black,
                                      avatar: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/Android-Logo.png'),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ],
                  ));
            },
            childCount: 1,
          ))
        ],
      ),
    );
  }
}

class CarruselImages extends StatelessWidget {
  const CarruselImages({
    super.key,
    required this.project,
  });

  final Projects project;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 800,
      child: Swiper(
        autoplay: true,
        itemBuilder: (context, index) {
          return Image.network(
            project.imagenesProject[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: project.imagenesProject.length,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.white,
            color: Colors.black,
            size: 10,
            activeSize: 15,
          ),
        ),
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  const _CustomSliverAppBar({required this.project});

  final Projects project;

  @override
  Widget build(BuildContext context) {
    debugPrint("🪵 Nombre del proyecto: ${project.nombre}");
    final size = MediaQuery.of(context).size;
    return SliverAppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        expandedHeight: size.height * 0.7,
        foregroundColor: Colors.white,
        title: Text(
          project.nombre,
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.start,
        ),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            children: [
              SizedBox.expand(
                child: Image.network(
                  project.imagen,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    stops: const [
                      0.0,
                      0.1,
                    ],
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
