
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_runny/presentation/widgets/backaground_page.dart';
import 'package:portfolio_runny/presentation/widgets/piechart_skills.dart';
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

            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/yo.jpg'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            AnimatedTextKit(animatedTexts: [
                              TyperAnimatedText(
                                '¿QUIEN SOY?',
                                speed: Duration(milliseconds: 50),
                                textStyle: TextStyle(
                                    fontSize: 25,
                                    
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 5),
                              ),
                            ]),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Mi nombre es Ronald Vera y soy un desarrollador Full Stack especializado en la creación de aplicaciones multiplataforma (iOS, Android, Web y Escritorio) utilizando Flutter y Dart. Además, tengo experiencia en desarrollo con Java y Python  Me enfoco en construir aplicaciones escalables, reutilizables y fáciles de mantener, siguiendo una arquitectura de programación limpia. Esto permite que las soluciones sean flexibles y adaptables a nuevas funcionalidades con facilidad. Mi objetivo es desarrollar software eficiente y bien estructurado, ofreciendo una experiencia de usuario óptima y asegurando la calidad del código en cada proyecto',
                              style: TextStyle(
                                  fontSize: 20,
                                  
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 2),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            AnimatedTextKit(animatedTexts: [
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
                            ]),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(child: PiechartSkills()),
                           
                          ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
    );
  }
}