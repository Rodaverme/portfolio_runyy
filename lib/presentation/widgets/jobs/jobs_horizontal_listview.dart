import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_runny/domain/entities/projects.dart';

class JobsHorizontalListview extends StatelessWidget {
  final List<Projects> projects;
  JobsHorizontalListview({super.key, required this.projects});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        scrollController.jumpTo(scrollController.offset - details.delta.dx);
      },
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Padding(
            padding: const EdgeInsets.only(right: 24),
            child: _JobCard(project: project),
          );
        },
      ),
    );
  }
}

class _JobCard extends StatefulWidget {
  final Projects project;
  const _JobCard({required this.project});

  @override
  State<_JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<_JobCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = widget.project.isAndroid == true || widget.project.isIos == true;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: _isHovered ? 1.03 : 1.0,
        child: FadeInLeftBig(
          child: Container(
            width: 380,
            height: 400,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  // 📱 Diseño según tipo
                  if (isMobile)
                    _MobilePreview(image: widget.project.imagen)
                  else
                    _DesktopPreview(image: widget.project.imagen),

                  // 🔹 Gradiente de fondo para contraste de texto
                  if (!isMobile)
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),

                  // 🏷️ Logo (arriba derecha)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                      ),
                      child: Container(
                        height: 90,
                        width: 130,
                        color: Colors.white,
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/loading.gif'),
                          image: NetworkImage(widget.project.logo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // 📄 Info inferior
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.deepPurpleAccent.withOpacity(0.8)
                            : Colors.deepPurple,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.project.nombre,
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            widget.project.descripcion.length > 80
                                ? '${widget.project.descripcion.substring(0, 80)}...'
                                : widget.project.descripcion,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white70,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
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

// Diseño tipo celular
class _MobilePreview extends StatelessWidget {
  final String image;
  const _MobilePreview({required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.black,
          border: Border.all(color: Colors.black, width: 6),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// Diseño tipo escritorio o web
class _DesktopPreview extends StatelessWidget {
  final String image;
  const _DesktopPreview({required this.image});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage('assets/loading.gif'),
      image: NetworkImage(image),
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
