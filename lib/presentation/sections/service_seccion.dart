// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ServiciosSection extends StatelessWidget {
  const ServiciosSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          // 🔹 Fondo dinámico según tema
          Positioned.fill(
            child: Container(
              color: isDarkTheme ? Colors.black : Colors.white,
            ),
          ),

          // 🔹 Contenido principal
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Servicios',
                    style: theme.textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Ofrezco una gama completa de servicios de desarrollo Flutter para llevar tu idea desde el concepto hasta la realidad',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: isDarkTheme ? Colors.grey[300] : Colors.grey[700],
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // 🔹 Grid responsivo centrado y más pequeño
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                          maxWidth: 1000), // 🔸 limita el ancho total
                      child: LayoutBuilder(builder: (context, constraints) {
                        final crossAxisCount = isMobile ? 1 : 2;
                        return GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio:
                              2.8, // 🔸 hace las tarjetas más pequeñas
                          physics: const NeverScrollableScrollPhysics(),
                          children: const [
                            ServicioCard(
                              icon: Icons.palette_outlined,
                              title: 'Diseño UI/UX',
                              description:
                                  'Interfaces intuitivas y atractivas que deleitan a los usuarios',
                            ),
                            ServicioCard(
                              icon: Icons.flash_on_outlined,
                              title: 'Desarrollo Rápido',
                              description:
                                  'Entrega ágil de aplicaciones de alta calidad',
                            ),
                            ServicioCard(
                              icon: Icons.group_outlined,
                              title: 'Consultoría',
                              description:
                                  'Asesoramiento técnico para tu proyecto Flutter',
                            ),
                            ServicioCard(
                              icon: Icons.build_outlined,
                              title: 'Mantenimiento',
                              description:
                                  'Soporte continuo y actualizaciones de aplicaciones',
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServicioCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServicioCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<ServicioCard> createState() => _ServicioCardState();
}

class _ServicioCardState extends State<ServicioCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isDarkTheme ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: _hovering
              ? [
                  BoxShadow(
                    color: isDarkTheme
                        ? Colors.white10
                        : Colors.black12.withOpacity(0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  )
                ]
              : [
                  BoxShadow(
                    color: isDarkTheme
                        ? Colors.white10.withOpacity(0.05)
                        : Colors.black12.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ],
          border: Border.all(
            color: isDarkTheme ? Colors.grey[800]! : Colors.grey[300]!,
            width: 1.2,
          ),
        ),
        padding: const EdgeInsets.all(
            20), // 🔸 menos padding para que sea más compacta
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.icon,
                size: 36, color: Colors.blue[700]), // 🔸 ícono más pequeño
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDarkTheme ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDarkTheme ? Colors.grey[300] : Colors.grey[700],
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
