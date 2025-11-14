// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MiTrayectoriaSection extends StatelessWidget {
  const MiTrayectoriaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          // 🔹 Fondo dinámico
          Positioned.fill(
            child: Container(
              color: isDark ? Colors.black : Colors.white,
            ),
          ),

          // 🔹 Contenido
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Mi Trayectoria',
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Un recorrido por mi experiencia profesional y formación académica',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: isDark ? Colors.grey[300] : Colors.grey[700],
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 60),

                      // 🔹 Línea de tiempo
                      Column(
                        children: const [
                          TimelineItem(
                            icon: Icons.laptop_mac_outlined,
                            title: 'Desarrollador Flutter Senior',
                            subtitle: 'Tech Company',
                            description:
                                'Desarrollo de aplicaciones multiplataforma para clientes internacionales. Liderazgo técnico en proyectos de gran escala.',
                            date: '2022 - Presente',
                            location: 'Remoto',
                          ),
                          TimelineItem(
                            icon: Icons.school_outlined,
                            title: 'Certificación Flutter Avanzado',
                            subtitle: 'Google Developers',
                            description:
                                'Certificación oficial en desarrollo avanzado con Flutter y Dart.',
                            date: '2021',
                          ),
                          TimelineItem(
                            icon: Icons.work_outline,
                            title: 'Desarrollador Mobile',
                            subtitle: 'Startup Tech',
                            description:
                                'Desarrollo de aplicaciones móviles nativas y multiplataforma. Implementación de arquitecturas limpias y escalables.',
                            date: '2020 - 2022',
                            location: 'Ciudad',
                          ),
                          TimelineItem(
                            icon: Icons.menu_book_outlined,
                            title: 'Ingeniería en Sistemas',
                            subtitle: 'Universidad Tecnológica',
                            description:
                                'Especialización en desarrollo de software y aplicaciones móviles.',
                            date: '2016 - 2020',
                          ),
                          TimelineItem(
                            icon: Icons.menu_book_outlined,
                            title: 'Ingeniería en Sistemas',
                            subtitle: 'Universidad Tecnológica',
                            description:
                                'Especialización en desarrollo de software y aplicaciones móviles.',
                            date: '2016 - 2020',
                          ),
                          TimelineItem(
                            icon: Icons.menu_book_outlined,
                            title: 'Ingeniería en Sistemas',
                            subtitle: 'Universidad Tecnológica',
                            description:
                                'Especialización en desarrollo de software y aplicaciones móviles.',
                            date: '2016 - 2020',
                          ),
                          TimelineItem(
                            icon: Icons.menu_book_outlined,
                            title: 'Ingeniería en Sistemas',
                            subtitle: 'Universidad Tecnológica',
                            description:
                                'Especialización en desarrollo de software y aplicaciones móviles.',
                            date: '2016 - 2020',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final String date;
  final String? location;

  const TimelineItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.date,
    this.location,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Stack(
      children: [
        // 🔹 Contenido principal
        Container(
          margin: const EdgeInsets.only(left: 60, bottom: 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Ícono circular
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 26),
              ),
              const SizedBox(width: 20),

              // 🔹 Tarjeta de información
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[900] : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isDark
                            ? Colors.white10.withOpacity(0.05)
                            : Colors.black12.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔹 Título y fecha
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color:
                                  isDark ? Colors.white : Colors.grey.shade900,
                            ),
                          ),
                          Text(
                            date,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color:
                                  isDark ? Colors.grey[400] : Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      // 🔹 Subtítulo
                      Text(
                        subtitle,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // 🔹 Descripción
                      Text(
                        description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: isDark ? Colors.grey[300] : Colors.grey[700],
                        ),
                      ),

                      // 🔹 Ubicación (si aplica)
                      if (location != null) ...[
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined,
                                size: 16, color: Colors.pink),
                            const SizedBox(width: 4),
                            Text(
                              location!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.pink[400],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
