import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutmeSeccion extends StatelessWidget {
  const AboutmeSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: _buildContentSection(context),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        final imageWidget = Transform.rotate(
          angle: -0.1,
          child: Container(
            width: isMobile ? 250 : 450,
            height: isMobile ? 250 : 450,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset('assets/yo1.jpg', fit: BoxFit.cover),
            ),
          ),
        );

        final textContent = Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment:
                isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Yo soy Ronald Vera',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              GradientText(
                'Mobile Developer',
                style: TextStyle(fontSize: isMobile ? 36 : 70),
                gradient: const LinearGradient(colors: [
                  Colors.deepPurpleAccent,
                  Colors.pinkAccent,
                  Colors.cyan,
                ]),
              ),
              const SizedBox(height: 10),
              const Text(
                'Desarrollador móvil multiplataforma apasionado por crear experiencias digitales impactantes.\n'
                'Con experiencia en Flutter, desarrollo aplicaciones elegantes, rápidas y funcionales para Android, iOS, Web y Escritorio.\n'
                'Me especializo en interfaces modernas, limpias y centradas en el usuario,\nsiempre siguiendo buenas prácticas de arquitectura y rendimiento.\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 15),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 10,
                children: [
                  FilledButton(
                    onPressed: () async {
                      final uri = Uri.parse(
                          'https://drive.google.com/file/d/196ZW089-NC8vVQt7Ttt22wiQVdXzDuXr/view?usp=drive_link');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      } else {}
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child:
                          Text('Download CV', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.linkedin,
                        color: SimpleIconColors.bluesky, size: 40),
                    onPressed: () {
                      go_to_page(
                          'https://www.linkedin.com/public-profile/settings?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_self_edit_contact-info%3BFsIgPuyzQnCuaXJWholKJQ%3D%3D');
                    },
                  ),
                  IconButton(
                    icon: const Icon(SimpleIcons.whatsapp,
                        color: SimpleIconColors.whatsapp, size: 40),
                    onPressed: () async {
                      final phoneNumber = '+573168211187';
                      final message = Uri.encodeComponent(
                          'Hola, me gustaría obtener más información para desarrollar una App.');
                      final url =
                          Uri.parse('https://wa.me/$phoneNumber?text=$message');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        debugPrint('No se pudo abrir WhatsApp');
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(SimpleIcons.github,
                        color: Colors.purpleAccent, size: 40),
                    onPressed: () async {
                      await go_to_page(
                          'https://github.com/Rodaverme?tab=repositories');
                    },
                  ),
                ],
              )
            ],
          ),
        );

        // Layout adaptativo
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: isMobile
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    imageWidget,
                    const SizedBox(height: 30),
                    textContent,
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textContent,
                    const SizedBox(width: 40),
                    imageWidget,
                  ],
                ),
        );
      },
    );
  }

  Future<void> go_to_page(String page) async {
    final url = Uri.parse(page);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // Manejar error si no se puede abrir WhatsApp
      debugPrint('No se pudo abrir Github');
    }
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => gradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
        child: AnimatedTextKit(
          totalRepeatCount: 2,
          animatedTexts: [TyperAnimatedText(text, textStyle: style)],
        ));
  }
}
