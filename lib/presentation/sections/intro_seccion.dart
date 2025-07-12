import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_runny/presentation/widgets/backaground_page.dart';

class IntroSeccion extends StatelessWidget {
  const IntroSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height, // ✅ Altura visible garantizada
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(painter: BackgroundPainter()),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hola, soy runny', style: theme.textTheme.displaySmall),
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final screenWidth = constraints.maxWidth;
                    final isSmall = screenWidth < 400;

                    final textStyle = theme.textTheme.displayLarge?.copyWith(
                      fontSize: isSmall ? 28 : 40, // Ajuste responsivo
                    );

                    return Center(
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText('Flutter Dev',
                              speed: const Duration(milliseconds: 50),
                              textStyle: textStyle),
                          TyperAnimatedText('Dart Dev',
                              speed: const Duration(milliseconds: 50),
                              textStyle: textStyle),
                          TyperAnimatedText('Mobile Dev',
                              speed: const Duration(milliseconds: 50),
                              textStyle: textStyle),
                          TyperAnimatedText('Web Dev',
                              speed: const Duration(milliseconds: 50),
                              textStyle: textStyle),
                          TypewriterAnimatedText('UI/UX',
                              speed: const Duration(milliseconds: 50),
                              textStyle: textStyle),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => context.go('/contact'),
                  child: const Text(
                    'Contactame',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
