import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_runny/presentation/widgets/jobs/jobs_horizontal_listview.dart';

import '../widgets/backaground_page.dart';

class WorksDone extends StatelessWidget {
  const WorksDone({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedTextKit(animatedTexts: [
                  TyperAnimatedText(
                    'Trabajos Realizados',
                    speed: const Duration(milliseconds: 50),
                    textStyle: theme.textTheme.displayLarge,
                  ),
                ]),
                const SizedBox(height: 20), // Espaciado entre el título y la lista
                
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: const [
                      JobsHorizontalListview(),
                      SizedBox(height: 20), // Espaciado entre las listas
                      JobsHorizontalListview(),
                    ],
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
