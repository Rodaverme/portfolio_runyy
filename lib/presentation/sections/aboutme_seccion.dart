import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_runny/presentation/widgets/backaground_page.dart';

class AboutmeSeccion extends StatelessWidget {
  const AboutmeSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: BackgroundPainter(),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildContentSection(context)),
        ),
      ],
    );
  }

  Widget _buildContentSection(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.height;
    return Container(
      height: sizeH * 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
//PERSONAL INFORMATION
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TITULO DEV MOBILE
                Text(
                  'Yo soy Ronald Vera',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                GradientText('Mobile Developer',
                    style: TextStyle(fontSize: 70),
                    gradient: LinearGradient(colors: [
                      Colors.deepPurpleAccent,
                      Colors.pinkAccent,
                      Colors.cyan
                    ])),
                //Descripcion del texto
                Text(
                  'Desarrollador móvil multiplataforma apasionado por crear experiencias digitales impactantes.\n'
                  'Con experiencia en Flutter, desarrollo aplicaciones elegantes, rápidas y funcionales para Android, iOS, Web y Escritorio.\n'
                  'Me especializo en interfaces modernas, limpias y centradas en el usuario,\n siempre siguiendo buenas prácticas de arquitectura y rendimiento.\n'
                  '\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 200, // Ancho personalizado
                      height: 50, // Alto personalizado
                      child: FilledButton(
                        onPressed: () {
                          // Acción al presionar
                        },
                        child: Text(
                          'Download CV',
                          style: TextStyle(fontSize: 18), // Texto más grande
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.facebook_outlined,
                        size: 50,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.mail,
                        size: 50,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.phone_android_rounded,
                        size: 50,
                      ),
                      onPressed: () {},
                    )
                  ],

                )
                //TECNOLOGIAS
                
              ],
            ),
          ),

          SizedBox(
            width: 50,
          ),
//PHOTO
          Transform.rotate(
            angle:
                -0.1, // Rota el contenedor unos grados (en radianes, negativo hacia la izquierda)
            child: Container(
              width: 450, // Ajusta según lo necesites
              height: 450,
              decoration: BoxDecoration(
                color: Colors.white, // Color del fondo del recuadro
                borderRadius:
                    BorderRadius.circular(16), // Opcional: esquinas redondeadas
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/yo1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
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
          totalRepeatCount: 1,
          animatedTexts: [TyperAnimatedText(text, textStyle: style)],
        ));
  }
}