import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_runny/presentation/widgets/backaground_page.dart';

class IntroSeccion extends StatelessWidget {
  const IntroSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(children: [
      Positioned.fill(
        child: CustomPaint(
          painter: BackgroundPainter(),
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


