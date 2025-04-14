import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_runny/domain/entities/projects.dart';
import 'package:portfolio_runny/presentation/providers/projects/project_repository_provider.dart';

final projectBySlugProvider = FutureProvider.family<Projects?, String>((ref, slug) async {
  final datasource = ref.read(projectRepositoryProvider);
  return await datasource.getProjectBySlug(slug);
});

