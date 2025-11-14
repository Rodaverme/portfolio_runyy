
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_runny/domain/entities/projects.dart';
import 'mobile_preview.dart';
import 'desktop_preview.dart';
import 'project_image_carousel.dart';
import 'project_details_info.dart';

class AnimatedProjectCard extends StatelessWidget {
  final Projects project;
  final int index;
  const AnimatedProjectCard({super.key, required this.project, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = (project.isAndroid ?? false) || (project.isIos ?? false);

    return FadeInLeftBig(
      delay: Duration(milliseconds: 80 * index),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => _showProjectDetails(context, project),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 6),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Material(
              type: MaterialType.card,
              child: Stack(
                children: [
                  if (isMobile)
                    MobilePreview(image: project.imagen)
                  else
                    DesktopPreview(image: project.imagen),
                    //Logo
                  Positioned(
                    top: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16)),
                      child: Container(
                        height: 70,
                        width: 110,
                        color: isDark ? Colors.white10 : Colors.white,
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/loading.gif'),
                          image: NetworkImage(project.logo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(16)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(project.nombre,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text(
                            project.descripcion,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showProjectDetails(BuildContext context, Projects project) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.all(20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          project.nombre,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                isMobile
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProjectImageCarousel(
                            images: project.imagenesProject,
                            project: project,
                          ),
                          const SizedBox(height: 20),
                          ProjectDetailsInfo(project: project),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                          Expanded(
                            flex: 1,
                            child: ProjectImageCarousel(
                              images: project.imagenesProject,
                              project: project,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            flex: 1,
                            child: ProjectDetailsInfo(project: project),
                          ),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
