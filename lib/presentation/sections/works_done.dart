import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_runny/presentation/providers/projects/project_repository_provider.dart';
import 'package:portfolio_runny/presentation/widgets/jobs/jobs_horizontal_listview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/backaground_page.dart';
import 'package:portfolio_runny/domain/entities/projects.dart';

// Provider para obtener la lista de proyectos desde Firebase
final projectsProvider = FutureProvider<List<Projects>>((ref) async {
  final repository = ref.watch(projectRepositoryProvider);
  return await repository.getProjects();
});

class WorksDone extends ConsumerWidget {
  const WorksDone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    final projectsAsync = ref.watch(projectsProvider);

    return Container(
      height: height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: BackgroundPainter())),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Trabajos Realizados',
                      speed: const Duration(milliseconds: 50),
                      textStyle: theme.displayLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 450,
                  child: projectsAsync.when(
                    data: (projects) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: JobsHorizontalListview(projects: projects),
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error, _) => Center(child: Text('Error: $error')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
