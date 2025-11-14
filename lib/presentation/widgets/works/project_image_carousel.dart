import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_runny/domain/entities/projects.dart';

class ProjectImageCarousel extends StatefulWidget {
  final List<String> images;
  final Projects project;

  const ProjectImageCarousel({
    super.key,
    required this.images,
    required this.project,
  });

  @override
  State<ProjectImageCarousel> createState() => _ProjectImageCarouselState();
}

class _ProjectImageCarouselState extends State<ProjectImageCarousel> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasVideo =
        widget.project.videoUrl != null && widget.project.videoUrl!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (hasVideo) const SizedBox(height: 20),
        CarouselSlider(
          items: widget.images
              .asMap()
              .entries
              .map(
                (entry) => GestureDetector(
                  onTap: () => _showFullImage(context, entry.key),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/loading.gif'),
                      image: NetworkImage(entry.value),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            height: 750,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (i, _) => setState(() => current = i),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.asMap().entries.map((entry) {
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: current == entry.key
                    ? theme.colorScheme.primary
                    : Colors.grey.shade400,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _showFullImage(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (_) => _FullImageViewer(
        images: widget.images,
        initialIndex: index,
      ),
    );
  }
}

class _FullImageViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const _FullImageViewer({
    required this.images,
    required this.initialIndex,
  });

  @override
  State<_FullImageViewer> createState() => _FullImageViewerState();
}

class _FullImageViewerState extends State<_FullImageViewer> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.95),
        body: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (i) => setState(() => currentIndex = i),
              itemBuilder: (_, i) {
                return InteractiveViewer(
                  panEnabled: true,
                  minScale: 0.8,
                  maxScale: 4.0,
                  child: Center(
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/loading.gif'),
                      image: NetworkImage(widget.images[i]),
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 32),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              bottom: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.images.asMap().entries.map((entry) {
                  return Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == entry.key
                          ? Colors.white
                          : Colors.white30,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
