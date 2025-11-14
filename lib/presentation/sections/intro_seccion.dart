import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroSeccion extends StatelessWidget {
  const IntroSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height, // ✅ Altura visible garantizada
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hola, Soy Runny',
                style: theme.textTheme.displaySmall?.copyWith(fontSize: 50)),
            const SizedBox(height: 20),
            LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = constraints.maxWidth;
                final isSmall = screenWidth < 400;

                final textStyle = theme.textTheme.displayLarge?.copyWith(
                  fontSize: isSmall ? 28 : 60, // Ajuste responsivo
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => context.go('/works'),
                    child: const Text(
                      'Ver Proyectos',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 5,
                      ),
                    )),
                const SizedBox(width: 10),
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

            const SizedBox(height: 50),

            // 👇 Flecha animada que indica que hay más contenido abajo
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 20),
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              builder: (context, value, child) {
                return Padding(
                  padding: EdgeInsets.only(top: value),
                  child: child,
                );
              },
              onEnd: () {}, // evita que la animación se corte
              child: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
