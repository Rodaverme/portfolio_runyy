import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_runny/presentation/widgets/backaground_page.dart';
import 'package:portfolio_runny/presentation/widgets/piechart_skills.dart';

class AboutmeSeccion extends StatelessWidget {
  const AboutmeSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    final isTablet = screenWidth >= 800 && screenWidth < 1200;

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
            child: isMobile
                ? _buildMobileLayout(context)
                : isTablet
                    ? _buildTabletLayout(context)
                    : _buildDesktopLayout(context),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 2,
          child: _buildImageContainer(500),
        ),
        const SizedBox(width: 20),
        Flexible(
          flex: 3,
          child: _buildContentSection(context),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      children: [
        _buildImageContainer(400),
        const SizedBox(height: 20),
        _buildContentSection(context),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildImageContainer(300),
        const SizedBox(height: 20),
        _buildContentSection(context),
      ],
    );
  }

  Widget _buildImageContainer(double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(color: Colors.deepPurple, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(
              'assets/yo.jpg',
              width: width,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.4)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                '¡Hola, soy yo!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black87,
                      blurRadius: 10,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                '¿QUIEN SOY?',
                speed: Duration(milliseconds: 50),
                textStyle: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Mi nombre es Ronald Vera y soy un desarrollador Full Stack especializado en la creación de aplicaciones multiplataforma (iOS, Android, Web y Escritorio) utilizando Flutter y Dart. Además, tengo experiencia en desarrollo con Java y Python. Me enfoco en construir aplicaciones escalables, reutilizables y fáciles de mantener, siguiendo una arquitectura de programación limpia. Esto permite que las soluciones sean flexibles y adaptables a nuevas funcionalidades con facilidad. Mi objetivo es desarrollar software eficiente y bien estructurado, ofreciendo una experiencia de usuario óptima y asegurando la calidad del código en cada proyecto',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w300,
              letterSpacing: 2),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'HABILIDADES',
                speed: Duration(milliseconds: 50),
                textStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: PiechartSkills(),
          ),
        ],
      ),
    );
  }
}