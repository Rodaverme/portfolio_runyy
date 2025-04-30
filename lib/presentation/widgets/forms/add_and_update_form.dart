import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_runny/domain/entities/projects.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/cloudinary_fotos_services.dart';
import '../../providers/projects/project_repository_provider.dart';

class AddAndUpdateForm extends ConsumerStatefulWidget {
  const AddAndUpdateForm({super.key, this.project});

  final Projects? project;

  @override
  ConsumerState<AddAndUpdateForm> createState() => _AddAndUpdateFormState();
}

class _AddAndUpdateFormState extends ConsumerState<AddAndUpdateForm> {
  late final TextEditingController nameController;
  late final TextEditingController descriptionController;
  late final TextEditingController slugController;
  late final TextEditingController logoController;
  late final TextEditingController imagenController;
  late final TextEditingController caracteristicasController;

  late final ValueNotifier<List<String>> imagenesProject;
  late final ValueNotifier<bool> isAndroid;
  late final ValueNotifier<bool> isIos;
  late final ValueNotifier<bool> isWeb;
  late final ValueNotifier<bool> isDesktop;

  final picker = ImagePicker();
  final cloudinaryFotosServices = CloudinaryFotosServices();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.project?.nombre);
    descriptionController =
        TextEditingController(text: widget.project?.descripcion);
    slugController = TextEditingController(text: widget.project?.slug);
    logoController = TextEditingController(text: widget.project?.logo);
    imagenController = TextEditingController(text: widget.project?.imagen);
    caracteristicasController = TextEditingController(
      text: widget.project?.caracteristicas.join(', '),
    );

    imagenesProject =
        ValueNotifier<List<String>>(widget.project?.imagenesProject ?? []);
    isAndroid = ValueNotifier<bool>(widget.project?.isAndroid ?? false);
    isIos = ValueNotifier<bool>(widget.project?.isIos ?? false);
    isWeb = ValueNotifier<bool>(widget.project?.isWeb ?? false);
    isDesktop = ValueNotifier<bool>(widget.project?.isDektop ?? false);
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    slugController.dispose();
    logoController.dispose();
    imagenController.dispose();
    caracteristicasController.dispose();
    imagenesProject.dispose();
    isAndroid.dispose();
    isIos.dispose();
    isWeb.dispose();
    isDesktop.dispose();
    super.dispose();
  }

  Future<void> pickAndUploadImage(TextEditingController controller) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageBytes =
          await pickedFile.readAsBytes(); // ✅ compatible en Web y Móvil
      final uploadedUrl = await cloudinaryFotosServices.uploadImage(
        imageBytes: imageBytes,
        fileName: pickedFile.name,
      );
      if (uploadedUrl != null) {
        controller.text = uploadedUrl;
      }
    }
  }

  Future<void> pickAndUploadMultipleImages(
      ValueNotifier<List<String>> imagenesProject) async {
    final pickedFiles = await picker.pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      for (var pickedFile in pickedFiles) {
        final imageBytes = await pickedFile.readAsBytes(); // ✅
        final uploadedUrl = await cloudinaryFotosServices.uploadImage(
          imageBytes: imageBytes,
          fileName: pickedFile.name,
        );
        if (uploadedUrl != null) {
          imagenesProject.value = [...imagenesProject.value, uploadedUrl];
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project == null
            ? 'Añadir Nuevo Proyecto'
            : 'Actualizar Proyecto'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          labelText: 'Nombre del Proyecto'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: slugController,
                      decoration: const InputDecoration(labelText: 'Slug'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Logo'),
                        const SizedBox(height: 10),
                        logoController.text.isNotEmpty
                            ? FadeInImage(
                                placeholder: AssetImage('assets/loading.gif'),
                                image: NetworkImage(logoController.text),
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : const Image(
                                image: AssetImage('assets/noimage.jpeg'),
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                        Center(
                          child: TextButton(
                            onPressed: () => pickAndUploadImage(logoController),
                            child: const Text('Cambiar Logo'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Imagen Principal'),
                        const SizedBox(height: 10),
                        imagenController.text.isNotEmpty
                            ? FadeInImage(
                                placeholder: AssetImage('assets/loading.gif'),
                                image: NetworkImage(imagenController.text),
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : const Image(
                                image: AssetImage('assets/noimage.jpeg'),
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                        Center(
                          child: TextButton(
                            onPressed: () =>
                                pickAndUploadImage(imagenController),
                            child: const Text('Cambiar Imagen Principal'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: caracteristicasController,
                decoration: const InputDecoration(
                  labelText: 'Características (separadas por comas)',
                ),
              ),
              const SizedBox(height: 20),
              GridImagesProject(
                imagenesProject: imagenesProject,
                onAddImage: pickAndUploadMultipleImages,
              ),
              const SizedBox(height: 20),
              TextField(
                maxLines: 3,
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder<bool>(
                valueListenable: isAndroid,
                builder: (context, value, child) {
                  return CheckboxListTile(
                    title: const Text('Android'),
                    value: value,
                    onChanged: (newValue) =>
                        isAndroid.value = newValue ?? false,
                  );
                },
              ),
              ValueListenableBuilder<bool>(
                valueListenable: isIos,
                builder: (context, value, child) {
                  return CheckboxListTile(
                    title: const Text('iOS'),
                    value: value,
                    onChanged: (newValue) => isIos.value = newValue ?? false,
                  );
                },
              ),
              ValueListenableBuilder<bool>(
                valueListenable: isWeb,
                builder: (context, value, child) {
                  return CheckboxListTile(
                    title: const Text('Web'),
                    value: value,
                    onChanged: (newValue) => isWeb.value = newValue ?? false,
                  );
                },
              ),
              ValueListenableBuilder<bool>(
                valueListenable: isDesktop,
                builder: (context, value, child) {
                  return CheckboxListTile(
                    title: const Text('Desktop'),
                    value: value,
                    onChanged: (newValue) =>
                        isDesktop.value = newValue ?? false,
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final updatedProject = Projects(
                    nombre: nameController.text,
                    descripcion: descriptionController.text,
                    slug: slugController.text,
                    logo: logoController.text,
                    imagen: imagenController.text,
                    caracteristicas: caracteristicasController.text
                        .split(',')
                        .map((e) => e.trim())
                        .toList(),
                    imagenesProject: imagenesProject.value,
                    isAndroid: isAndroid.value,
                    isIos: isIos.value,
                    isWeb: isWeb.value,
                    isDektop: isDesktop.value,
                  );
                  if (widget.project != null) {
                    ref.read(updateProjectProvider(updatedProject));

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Proyecto actualizado con éxito')),
                    );
                  } else {
                    ref.read(createProjectProvider(updatedProject));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                          content: Text('Proyecto creado con éxito')),
                    );
                  }
                },
                child: const Text('Guardar Cambios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridImagesProject extends StatelessWidget {
  const GridImagesProject({
    super.key,
    required this.imagenesProject,
    required this.onAddImage,
  });

  final ValueNotifier<List<String>> imagenesProject;
  final Future<void> Function(ValueNotifier<List<String>>) onAddImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Imágenes del Proyecto'),
        const SizedBox(height: 10),
        ValueListenableBuilder<List<String>>(
          valueListenable: imagenesProject,
          builder: (context, imagenes, _) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: imagenes.length + 1,
              itemBuilder: (context, index) {
                if (index < imagenes.length) {
                  return Stack(
                    children: [
                      FadeInImage(
                        placeholder: AssetImage('assets/loading.gif'),
                        image: NetworkImage(imagenes[index]),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            imagenesProject.value =
                                List.from(imagenesProject.value)
                                  ..removeAt(index);
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return GestureDetector(
                    onTap: () => onAddImage(imagenesProject),
                    child: Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),
      ],
    );
  }
}
