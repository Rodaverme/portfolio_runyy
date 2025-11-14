import 'package:flutter/material.dart';
import 'package:portfolio_runny/domain/entities/projects.dart';

import 'package:portfolio_runny/presentation/widgets/works/video_player_widget.dart';
import 'tag_chip.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsInfo extends StatelessWidget {
  final Projects project;
  const ProjectDetailsInfo({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final link = project.videoUrl ?? '';
    final hasVideo = project.videoUrl != null && project.videoUrl!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text('Descripcion del Proyecto',
              style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent)),
        ),
        const SizedBox(height: 8),
        Text(project.descripcion, style: theme.textTheme.bodyLarge),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              project.caracteristicas.map((t) => TagChip(text: t)).toList(),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 20,
        ),
       if (hasVideo)
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Video representativo de ${project.nombre}',
        style: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurpleAccent,
        ),
      ),
      const SizedBox(height: 20),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: SizedBox(
              width: double.infinity,
              child: VideoPlayerWidget(url: project.videoUrl!),
            ),
          ),
        ),
      ),
      const SizedBox(height: 30),
    ],
  ),
        SizedBox(
          height: 20,
        ),
        if (link.isNotEmpty)
          Center(
            child: FilledButton.icon(
              onPressed: () async {
                final uri = Uri.parse(link);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
              icon: const Icon(Icons.open_in_new),
              label: const Text('Ver Proyecto'),
            ),
          ),
      ],
    );
  }
}
