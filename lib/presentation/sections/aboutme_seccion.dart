import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_runny/presentation/widgets/backaground_page.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutmeSeccion extends StatelessWidget {
  const AboutmeSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height, // ✅ altura consistente
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: BackgroundPainter()),
          ),
          _buildContentSection(context),
        ],
      ),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Información personal
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Yo soy Ronald Vera',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                GradientText(
                  'Mobile Developer',
                  style: const TextStyle(fontSize: 70),
                  gradient: const LinearGradient(colors: [
                    Colors.deepPurpleAccent,
                    Colors.pinkAccent,
                    Colors.cyan,
                  ]),
                ),
                const Text(
                  'Desarrollador móvil multiplataforma apasionado por crear experiencias digitales impactantes.\n'
                  'Con experiencia en Flutter, desarrollo aplicaciones elegantes, rápidas y funcionales para Android, iOS, Web y Escritorio.\n'
                  'Me especializo en interfaces modernas, limpias y centradas en el usuario,\n siempre siguiendo buenas prácticas de arquitectura y rendimiento.\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {},
                        child: const Text('Download CV',
                            style: TextStyle(fontSize: 18)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.linkedin,
                          color: SimpleIconColors.facebook, size: 50),
                      onPressed: () {
                        go_to_page(
                            'https://www.linkedin.com/public-profile/settings?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_self_edit_contact-info%3BEY8bB1rtT2CwoG7TbHI9YA%3D%3D');
                      },
                    ),
                    IconButton(
                      icon: const Icon(SimpleIcons.whatsapp,
                          color: SimpleIconColors.whatsapp, size: 50),
                      onPressed: () async {
                        final phoneNumber =
                            '+573168211187'; // Cambia por el número de destino
                        final message = Uri.encodeComponent(
                            'Hola, me gustaría obtener más información para desarrollar una App.');
                        final url = Uri.parse(
                            'https://wa.me/$phoneNumber?text=$message');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        } else {
                          // Manejar error si no se puede abrir WhatsApp
                          debugPrint('No se pudo abrir WhatsApp');
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(SimpleIcons.github,
                          color: Colors.purpleAccent, size: 50),
                      onPressed: () async {
                        await go_to_page(
                            'https://github.com/Rodaverme?tab=repositories');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 50),
          Transform.rotate(
            angle: -0.1,
            child: Container(
              width: 450,
              height: 450,
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
          )
        ],
      ),
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
