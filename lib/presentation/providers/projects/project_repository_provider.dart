import 'package:portfolio_runny/infrastructure/datasources/project_firebase_datasource.dart';
import 'package:portfolio_runny/infrastructure/repositories/project_repository_impl.dart';
import 'package:riverpod/riverpod.dart';

final projectRepositoryProvider = Provider((ref) {
  return ProjectRepositoryImpl(ProjectFirebaseDatasource());
});
