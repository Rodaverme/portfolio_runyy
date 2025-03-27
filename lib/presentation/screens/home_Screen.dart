import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_runny/presentation/widgets/menu_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
   int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MenuHeader(),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
      body: PageView(scrollDirection: Axis.vertical, children: [
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.black,
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Hola, soy runny',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Plus Jakarta Sans',
                    fontWeight: FontWeight.w300,
                    letterSpacing: 5),
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedTextKit(repeatForever: true, animatedTexts: [
                TyperAnimatedText(
                  'Flutter Developer',
                  speed: Duration(milliseconds: 50),
                  textStyle: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Plus Jakarta Sans',
                      letterSpacing: 15),
                ),
                TyperAnimatedText(
                  'Dart Developer',
                  speed: Duration(milliseconds: 50),
                  textStyle: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Plus Jakarta Sans',
                      letterSpacing: 15),
                ),
                TyperAnimatedText(
                  'Mobile Developer',
                  speed: Duration(milliseconds: 50),
                  textStyle: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Plus Jakarta Sans',
                      letterSpacing: 15),
                ),
                TyperAnimatedText(
                  'Web Developer',
                  speed: Duration(milliseconds: 50),
                  textStyle: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Plus Jakarta Sans',
                      letterSpacing: 15),
                ),
                TypewriterAnimatedText('UI/UX Designer',
                    textStyle: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Plus Jakarta Sans',
                        letterSpacing: 15),
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
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 5),
                  )),
            ],
          ),
        ),
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.black,
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
                                color: Colors.white,
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
                              color: Colors.white,
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
                        Expanded(child: _buildPieChart())
                       
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.blue,
        ),
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Colors.green,
        ),
      ]),
    );
  }

Widget _buildPieChart() {
    return AspectRatio(
      
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions || pieTouchResponse?.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex = pieTouchResponse!.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          sections: _showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> _showingSections() {
    final data = [
      {'title': 'Flutter', 'value': 5, 'color': Colors.blue},
      {'title': 'Dart', 'value': 5, 'color': Colors.orange},
      {'title': 'Java', 'value': 3, 'color': Colors.green},
      {'title': 'Python', 'value': 2, 'color': Colors.red},
      {'title': 'UI/UX', 'value': 3, 'color': Colors.purple},
      {'title': 'Firebase', 'value': 2, 'color': Colors.brown},
      {'title': 'SQL', 'value': 2, 'color': Colors.cyan},
      {'title': 'NoSQL', 'value': 2, 'color': Colors.pink},
    ];

    return List.generate(data.length, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 20.0 : 16.0;
      final double radius = isTouched ? 120.0 : 100.0;
      return PieChartSectionData(
        color: data[i]['color'] as Color,
        value: data[i]['value'] as double,
        title: data[i]['title'] as String,
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    });
  }

  
}





