// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio_runny/presentation/sections/sections.dart';
class HomeScreen extends ConsumerStatefulWidget {
  final String currentPath;
  const HomeScreen({super.key, required this.currentPath});

  @override
  ConsumerState<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<HomeScreen> {
  final PageController _pageController = PageController();
  final Map<String, int> sectionIndex = {
    '/': 0,
    '/aboutme': 1,
    '/services': 2,
    '/works': 3,
    '/contact': 4,
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
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  bool isDarkTheme =
                      Theme.of(context).brightness == Brightness.dark;

                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Dark Theme'),
                                Switch(
                                  value: isDarkTheme,
                                  onChanged: (value) {
                                    setState(() {
                                      isDarkTheme = value;
                                    });
                                    // Update the app theme
                                    final themeMode = isDarkTheme
                                        ? ThemeMode.dark
                                        : ThemeMode.light;
                                    ref.read(themeModeProvider.notifier).state =
                                        themeMode;

                                    // MyApp.of(context).setThemeMode(t5hemeMode);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
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
          ContactMe()
        ],
      ),
    );
  }
}
