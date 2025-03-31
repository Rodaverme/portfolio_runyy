import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class IntroSeccion extends StatelessWidget {
  const IntroSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(children: [
      Positioned.fill(
        child: CustomPaint(
          painter: _BackgroundPainter(),
        ),
      ),
      Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hola, soy runny', style: theme.textTheme.displaySmall),
            SizedBox(
              height: 20,
            ),
            AnimatedTextKit(repeatForever: true, animatedTexts: [
              TyperAnimatedText('Flutter Developer',
                  speed: Duration(milliseconds: 50),
                  textStyle: theme.textTheme.displayLarge),
              TyperAnimatedText('Dart Developer',
                  speed: Duration(milliseconds: 50),
                  textStyle: theme.textTheme.displayLarge),
              TyperAnimatedText('Mobile Developer',
                  speed: Duration(milliseconds: 50),
                  textStyle: theme.textTheme.displayLarge),
              TyperAnimatedText('Web Developer',
                  speed: Duration(milliseconds: 50),
                  textStyle: theme.textTheme.displayLarge),
              TypewriterAnimatedText('UI/UX Designer',
                  textStyle: theme.textTheme.displayLarge,
                  speed: Duration(milliseconds: 50)),
            ]),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Contactame',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 5),
                )),
          ],
        ),
      ),
    ]);
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    // Dibuja círculos en diferentes posiciones
    canvas.drawCircle(
      Offset(size.width * 0.2, size.height * 0.3),
      size.width * 0.15,
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.7),
      size.width * 0.1,
      paint,
    );

    // Dibuja un rectángulo rotado
    final rect = Rect.fromCenter(
      center: Offset(size.width * 0.7, size.height * 0.2),
      width: size.width * 0.2,
      height: size.width * 0.2,
    );
    canvas.save();
    canvas.rotate(0.5);
    canvas.drawRect(rect, paint);
    canvas.restore();

    // Dibuja un triángulo
    final path = Path()
      ..moveTo(size.width * 0.3, size.height * 0.8)
      ..lineTo(size.width * 0.4, size.height * 0.6)
      ..lineTo(size.width * 0.2, size.height * 0.7)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
