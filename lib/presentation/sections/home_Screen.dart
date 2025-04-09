
import 'package:flutter/material.dart';
import 'package:portfolio_runny/presentation/sections/aboutme_seccion.dart';
import 'package:portfolio_runny/presentation/sections/intro_seccion.dart';
import 'package:portfolio_runny/presentation/sections/works_done.dart';
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
       IntroSeccion(),
       AboutmeSeccion(),
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
        ),
        WorksDone()
      ]),
    );
  }



  
}





