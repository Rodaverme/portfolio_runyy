// import 'package:card_swiper/card_swiper.dart';
// import 'package:flutter/material.dart';
// import '../../domain/entities/projects.dart';

// class DetailsProject extends StatelessWidget {
//   final Projects project;

//   const DetailsProject({
//     super.key,
//     required this.project,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final List<String> tecnologias = ["Flutter", "Dart", "Isar DB"];

//     return Scaffold(
//       body: CustomScrollView(
//         physics: const ClampingScrollPhysics(),
//         slivers: [
//           _CustomSliverAppBar(project: project),
//           SliverList(
//             delegate: SliverChildListDelegate([
//               Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _ProjectDescription(project: project),
//                     const SizedBox(height: 20),
//                     _TecnologiasUtilizadas(tecnologias: tecnologias),
//                   ],
//                 ),
//               ),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ProjectDescription extends StatelessWidget {
//   final Projects project;

//   const _ProjectDescription({required this.project});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Descripción',
//                 style: Theme.of(context).textTheme.displaySmall,
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 project.descripcion,
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'Características',
//                 style: Theme.of(context).textTheme.displaySmall,
//               ),
//               const SizedBox(height: 10),
//               ...project.caracteristicas.map((feature) => Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text('• ', style: TextStyle(fontSize: 16)),
//                       Expanded(
//                         child: Text(
//                           feature,
//                           style: Theme.of(context).textTheme.bodyLarge,
//                         ),
//                       ),
//                     ],
//                   )),
//             ],
//           ),
//         ),
//         const SizedBox(width: 20),
//         CarruselImages(project: project),
//       ],
//     );
//   }
// }

// class _TecnologiasUtilizadas extends StatelessWidget {
//   final List<String> tecnologias;

//   const _TecnologiasUtilizadas({required this.tecnologias});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Tecnologías utilizadas",
//           style: Theme.of(context).textTheme.displaySmall,
//         ),
//         const SizedBox(height: 10),
//         Wrap(
//           spacing: 20,
//           runSpacing: 20,
//           children: tecnologias
//               .map(
//                 (tech) => Chip(
//                   label: Text(tech),
//                   backgroundColor: Colors.black,
//                   avatar: const CircleAvatar(
//                     backgroundImage: AssetImage('assets/Android-Logo.png'),
//                   ),
//                 ),
//               )
//               .toList(),
//         ),
//       ],
//     );
//   }
// }

// class CarruselImages extends StatelessWidget {
//   final Projects project;

//   const CarruselImages({super.key, required this.project});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 400,
//       width: 800,
//       child: Swiper(
//         autoplay: true,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => FullScreenImageViewer(
//                     imageUrl: project.imagenesProject[index],
//                   ),
//                 ),
//               );
//             },
//             child: FadeInImage.assetNetwork(
//               placeholder: 'assets/loading.gif',
//               image: project.imagenesProject[index],
//               fit: BoxFit.cover,
//               imageErrorBuilder: (_, __, ___) => Image.asset(
//                 'assets/no-image.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//         itemCount: project.imagenesProject.length,
//         viewportFraction: 0.8,
//         scale: 0.9,
//       ),
//     );
//   }
// }

// class FullScreenImageViewer extends StatelessWidget {
//   final String imageUrl;

//   const FullScreenImageViewer({super.key, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text(
//           'Imagen completa',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: FadeInImage.assetNetwork(
//             placeholder: 'assets/loading.gif',
//             image: imageUrl,
//             fit: BoxFit.contain,
//             imageErrorBuilder: (_, __, ___) => Image.asset(
//               'assets/no-image.png',
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _CustomSliverAppBar extends StatelessWidget {
//   final Projects project;

//   const _CustomSliverAppBar({required this.project});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return SliverAppBar(
//       toolbarHeight: 60,
//       backgroundColor: Colors.black,
//       expandedHeight: size.height * 0.7,
//       foregroundColor: Colors.white,
//       title: Text(
//         project.nombre,
//         style: Theme.of(context).textTheme.displaySmall,
//         textAlign: TextAlign.start,
//       ),
//       centerTitle: true,
//       flexibleSpace: FlexibleSpaceBar(
//         background: Stack(
//           children: [
//             SizedBox.expand(
//               child: Image.network(
//                 project.imagen,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   stops: const [0.0, 0.1],
//                   colors: [
//                     // ignore: deprecated_member_use
//                     Colors.black.withOpacity(0.5),
//                     Colors.transparent,
//                   ],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
