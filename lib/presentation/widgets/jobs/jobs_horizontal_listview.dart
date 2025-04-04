import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class JobsHorizontalListview extends StatefulWidget {
  const JobsHorizontalListview({super.key});

  @override
  State<JobsHorizontalListview> createState() => _JobsHorizontalListviewState();
}

class _JobsHorizontalListviewState extends State<JobsHorizontalListview> {
  final ScrollController scrollController = ScrollController();

  // Lista de imágenes (URLs o rutas locales)
  final List<String> jobImages = [
    'assets/SMURFIT.png',
    'assets/SMURFIT.png',
    'assets/SMURFIT.png',
    'assets/SMURFIT.png',
    'assets/SMURFIT.png',
    'assets/SMURFIT.png',
    'assets/SMURFIT.png',
    'assets/SMURFIT.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          Expanded(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  scrollController
                      .jumpTo(scrollController.offset - details.delta.dx);
                },
                child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: jobImages.length,
                  itemBuilder: (context, index) {
                    return _JobCard(imageUrl: jobImages[index]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget para cada tarjeta con imagen
class _JobCard extends StatelessWidget {
  final String imageUrl;

  const _JobCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return FadeInLeftBig(
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 400,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.broken_image, size: 50, color: Colors.red),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 10,
            left: 250,
            child: Container(
              width: 150,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/smurfit-kappa.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 60,
            child: Container(
              width: 200,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.deepPurple,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                child: Expanded(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nombre del trabajo',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Descripción breve del trabajo realizado.',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white70,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.desktop_windows_outlined),
                      SizedBox(width: 5),
                      Icon(
                        Icons.android,
                        color: Colors.green,
                      ),
                      SizedBox(width: 5,),
                      Icon(
                        Icons.apple,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        if (title != null)
          Text(
            title!,
            style: titleStyle,
          ),
        const Spacer(),
        if (subTitle != null)
          FilledButton.tonal(
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
            onPressed: () {},
            child: Text(subTitle!),
          ),
      ]),
    );
  }
}
