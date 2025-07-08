// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:portfolio_runny/presentation/sections/sections.dart';
import 'package:portfolio_runny/presentation/widgets/fotter_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final String currentPath;
  const HomeScreen({super.key, required this.currentPath});

  @override
  ConsumerState<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final introKey = GlobalKey();
  final aboutKey = GlobalKey();
  final servicesKey = GlobalKey();
  final worksKey = GlobalKey();
  final contactKey = GlobalKey();

  late final Map<String, GlobalKey> sectionKeys;

  @override
  void initState() {
    super.initState();
    sectionKeys = {
      '/': introKey,
      '/aboutme': aboutKey,
      '/services': servicesKey,
      '/works': worksKey,
      '/contact': contactKey,
    };

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSection(widget.currentPath);
    });
  }

  void _scrollToSection(String path) {
    final key = sectionKeys[path];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MenuHeader(
          onSectionSelected: (path) {
            _scrollToSection(path);
            context.go(
                path); // actualiza la URL para mantener navegación con GoRouter
          },
        ),
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
                                    ref.read(themeModeProvider.notifier).state =
                                        isDarkTheme
                                            ? ThemeMode.dark
                                            : ThemeMode.light;
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
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            IntroSeccion(key: introKey),
            AboutmeSeccion(key: aboutKey),
            ServiceSeccion(key: servicesKey),
            WorksDone(key: worksKey),
            ContactMe(key: contactKey),
            const FotterWidget()
          ],
        ),
      ),
    );
  }
}
