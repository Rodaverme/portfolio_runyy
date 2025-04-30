import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_runny/presentation/widgets/forms/add_and_update_form.dart';
import '../../domain/entities/projects.dart';
import '../providers/projects/project_repository_provider.dart';

class AdminProjectsDone extends ConsumerWidget {
  const AdminProjectsDone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectRepositoryProvider);
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              'Aquí van los proyectos realizados',
            ),
          ),
          SizedBox(height: 20), // Espaciado entre el título y la lista
          FutureBuilder<List<Projects>>(
            future: projectsAsync.getProjects(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final project = snapshot.data![index];
                    return ListTile(
                      leading: (project.logo.isNotEmpty
                              ? ImageLogo(project: project)
                              : Icon(Icons
                                  .image_not_supported) // Placeholder icon if logo is null or empty

                          ),

                      title: Text(project
                          .nombre), // Asume que `name` es un campo del proyecto
                      subtitle: Text(project.descripcion),

                      trailing: Icon(Icons.arrow_forward),

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddAndUpdateForm(project: project),
                          ),
                        );
                      },
                    );
                  },
                );
              } else {
                return Text('No projects found');
              }
            },
          ),
        ],
      ),
    );
  }
}

class ImageLogo extends StatelessWidget {
  const ImageLogo({
    super.key,
    required this.project,
  });

  final Projects project;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10), // Rounded corners
      child: SizedBox(
        width: 150, // Set a fixed width for the logo
        height: 150, // Set a fixed height for the logo
        
        child: project.logo.isNotEmpty
            ? Image.network(
                project.logo,
                fit: BoxFit.cover, 
                // Ensures the image covers the container
              )
            : Icon(
                Icons.image_not_supported,
                size: 30,
                color: Colors.grey, // Placeholder icon styling
              ),
      ),
    );
  }
}

