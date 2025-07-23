import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ServiceSeccion extends StatelessWidget {
  const ServiceSeccion({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        children: [
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TyperAnimatedText('Habilades',
                  speed: const Duration(milliseconds: 50),
                  ),
             
            ],
          ),
        ],
      ),
    );
  }
}
