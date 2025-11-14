import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_runny/domain/entities/projects.dart';
import 'package:portfolio_runny/presentation/providers/projects/project_repository_provider.dart';
import 'package:portfolio_runny/presentation/widgets/works/platform_filter.dart';
import 'package:portfolio_runny/presentation/widgets/works/project_card.dart';

// Provider para cargar proyectos
final projectsProvider = FutureProvider<List<Projects>>((ref) async {
  final repository = ref.watch(projectRepositoryProvider);
  return await repository.getProjects();
});

// Filtro de proyectos
final projectFilterProvider = StateProvider<String>((ref) => 'Todos');

class WorksDone extends ConsumerWidget {
  const WorksDone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final projectsAsync = ref.watch(projectsProvider);
    final selectedFilter = ref.watch(projectFilterProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Proyectos',
              style:
                  textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Text(
            'Explora algunos de mis trabajos recientes desarrollados con Flutter.',
            style: textTheme.bodyLarge?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Center(child: PlatformFilter()),
          const SizedBox(height: 26),
          projectsAsync.when(
            data: (projects) {
              final filtered = _filterProjects(projects, selectedFilter);
              if (filtered.isEmpty) {
                return const Center(
                    child: Text('No hay proyectos para esta categoría'));
              }

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: LayoutBuilder(builder: (context, constraints) {
                    const maxExtent = 460.0;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filtered.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: maxExtent,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 24,
                        childAspectRatio: 1.12,
                      ),
                      itemBuilder: (context, index) {
                        final project = filtered[index];
                        return AnimatedProjectCard(
                            project: project, index: index);
                      },
                    );
                  }),
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Center(child: Text('Error: $err')),
          ),
        ],
      ),
    );
  }

  List<Projects> _filterProjects(List<Projects> projects, String filter) {
    if (filter == 'Todos') return projects;
    switch (filter) {
      case 'Android':
        return projects.where((p) => (p.isAndroid ?? false)).toList();
      case 'iOS':
        return projects.where((p) => (p.isIos ?? false)).toList();
      case 'Desktop':
        return projects.where((p) => (p.isDektop ?? false)).toList();
      case 'Web':
        return projects.where((p) => (p.isWeb ?? false)).toList();
      default:
        return projects;
    }
  }
}
