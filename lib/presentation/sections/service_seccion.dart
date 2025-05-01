import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../widgets/backaground_page.dart';

class ServiceSeccion extends StatelessWidget {
  const ServiceSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;
        if (constraints.maxWidth > 1000) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth > 600) {
          crossAxisCount = 2;
        } else {
          crossAxisCount = 1;
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Stack(children: [
              CustomPaint(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                painter: BackgroundPainter(),
              ),
              Column(
                children: [
                  Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Servicios',
                          textStyle: theme.textTheme.displayLarge,
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  GridView.count(
                    crossAxisCount: crossAxisCount,
                    shrinkWrap: true,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildServiceCard(
                        context,
                        title: 'Android',
                        imagePath: 'assets/Android-Logo.png',
                        color: Colors.green.shade900,
                        description:
                            'Desarrollo aplicaciones nativas para Android, diseñadas para ofrecer un rendimiento óptimo, una interfaz intuitiva y una experiencia fluida para el usuario. Desde ideas iniciales hasta el despliegue en Google Play, acompaño todo el proceso para crear soluciones móviles funcionales, modernas y personalizadas a cada necesidad.',
                      ),
                      _buildServiceCard(
                        context,
                        title: 'iOS',
                        imagePath: 'assets/iOS-Logo.png',
                        color: Colors.blueGrey.shade800,
                        description:
                            'Creo aplicaciones móviles para dispositivos Apple con un enfoque en la usabilidad, el diseño elegante y el aprovechamiento del ecosistema iOS. Utilizo las últimas tecnologías y buenas prácticas para garantizar compatibilidad, seguridad y una experiencia de usuario que se sienta natural en iPhone y iPad.',
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Web',
                        imagePath: 'assets/Web-Logo.png',
                        color: Colors.deepPurple.shade900,
                        description:
                            'Desarrollo aplicaciones web responsivas y escalables, accesibles desde cualquier navegador y adaptadas a múltiples dispositivos. Ya sea un panel administrativo, una plataforma interactiva o una herramienta de gestión, construyo soluciones modernas con un enfoque en velocidad, seguridad y experiencia de usuario.',
                      ),
                      _buildServiceCard(
                        context,
                        title: 'Desktop',
                        imagePath: 'assets/Desktop-Logo.png',
                        color: Colors.teal.shade700,
                        description:
                            'Diseño y desarrollo aplicaciones de escritorio multiplataforma, ideales para sistemas internos, herramientas empresariales o soluciones personalizadas que requieren robustez y autonomía sin depender de navegadores o dispositivos móviles. Garantizo interfaces amigables, eficiencia y fácil mantenimiento.',
                      ),
                      _buildServiceCard(context,
                          title: 'Bases de Datos SQL',
                          imagePath: 'assets/Sql-Logo.png',
                          color: Colors.brown.shade700,
                          description:
                              'Diseño e implemento bases de datos relacionales (SQL) robustas, seguras y altamente estructuradas, ideales para aplicaciones que requieren integridad de datos, relaciones complejas y transacciones confiables. Utilizo sistemas como MySQL, PostgreSQL y SQLite para garantizar rendimiento, escalabilidad y organización eficiente de la información.'),
                      _buildServiceCard(context,
                          title: 'Base de Datos NoSQL',
                          imagePath: 'assets/NoSql-Logo.png',
                          color: Colors.blueAccent.shade200,
                          description:
                              'Trabajo con bases de datos NoSQL pensadas para entornos dinámicos, grandes volúmenes de datos y estructuras flexibles. Utilizo tecnologías como MongoDB, Firebase y Redis, ideales para aplicaciones en tiempo real, escalables horizontalmente o con necesidades de almacenamiento no relacional. Priorizo velocidad, eficiencia y adaptabilidad en el diseño.'),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        );
      },
    );
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required String title,
    required String imagePath,
    required String description,
    required Color color,
  }) {
    final theme = Theme.of(context);

    return ZoomIn(
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                title,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 2,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
