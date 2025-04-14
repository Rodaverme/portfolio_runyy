import 'package:flutter/material.dart';
import 'package:portfolio_runny/presentation/sections/aboutme_seccion.dart';
import 'package:portfolio_runny/presentation/sections/intro_seccion.dart';
import 'package:portfolio_runny/presentation/sections/service_seccion.dart';
import 'package:portfolio_runny/presentation/sections/works_done.dart';
import 'package:portfolio_runny/presentation/widgets/menu_header.dart';

class HomeScreen extends StatefulWidget {
  final String currentPath;
  const HomeScreen({super.key, required this.currentPath});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  final Map<String, int> sectionIndex = {
    '/': 0,
    '/aboutme': 1,
    '/services': 2,
    '/works': 3,
    
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final index = sectionIndex[widget.currentPath] ?? 0;
      _pageController.jumpToPage(index); // o animateToPage para efecto suave
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MenuHeader(),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: const [
          IntroSeccion(),
          AboutmeSeccion(),
          ServiceSeccion(),
          WorksDone(),
        ],
      ),
    );
  }
}

