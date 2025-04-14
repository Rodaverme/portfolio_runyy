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
  Widget build( BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final projectsAsync = ref.watch(projectsProvider);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Trabajos Realizados',
                      speed: const Duration(milliseconds: 50),
                      textStyle: theme.textTheme.displayLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Espaciado entre el título y la lista

                Expanded(
                  child: projectsAsync.when(
                    data: (projects) => ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        const SizedBox(height: 60), 
                        JobsHorizontalListview(projects: projects),
                        // Espaciado entre las listas
                        
                      ],
                    ),
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (error, stackTrace) => Center(child: Text('Error: $error')),
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
