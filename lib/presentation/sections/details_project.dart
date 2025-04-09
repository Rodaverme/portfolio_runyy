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
    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppBar(project: project),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.descripcion,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                   
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        if (project.isDektop == true)
                          const Icon(Icons.desktop_windows),
                        if (project.isAndroid == true)
                          const Icon(Icons.android, color: Colors.green),
                        if (project.isIos == true)
                          const Icon(Icons.apple, color: Colors.black),
                      ],
                    ),
                    const SizedBox(height: 20),
                    if (project.logo.isNotEmpty)
                      Center(
                        child: Image.network(
                          project.logo,
                          height: 100,
                          width: 100,
                        ),
                      ),
                  ],
                ),
              );
            },
            childCount: 1,
          ))
        ],
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
          project.nombre ?? 'Default Title',
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

    // child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           project.nombre,
    //           style: Theme.of(context).textTheme.headlineMedium,
    //         ),
    //         const SizedBox(height: 10),
    //         Image.network(
    //           project.imagen,
    //           width: double.infinity,
    //           height: 350,
    //           fit: BoxFit.cover,
    //         ),
    //         const SizedBox(height: 10),
    //         Text(
    //           project.descripcion,
    //           style: Theme.of(context).textTheme.bodyLarge,
    //         ),
    //         const SizedBox(height: 20),
    //         Row(
    //           children: [
    //             if (project.isDektop == true) const Icon(Icons.desktop_windows),
    //             if (project.isAndroid == true)
    //               const Icon(Icons.android, color: Colors.green),
    //             if (project.isIos == true)
    //               const Icon(Icons.apple, color: Colors.black),
    //           ],
    //         ),
    //         const SizedBox(height: 20),
    //         if (project.logo.isNotEmpty)
    //           Center(
    //             child: Image.network(
    //               project.logo,
    //               height: 100,
    //               width: 100,
    //             ),
    //           ),
    //       ],
    //     ),
  }
}
