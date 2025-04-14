import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      height: 150,
      child: isMobile ? _MobileMenu() : _DesktopMenu(),
    );
  }
}

class _DesktopMenu extends StatelessWidget {
  const _DesktopMenu();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Image(
          image: AssetImage('assets/logo-runny-dev.png'),
          width: 100,
          height: 80,
        ),
        MenuButton(
          label: 'Inicio',
          route: '/',
        ),
        MenuButton(
          label: '¿Quien soy?',
          route: 'aboutme',
        ),
        MenuButton(
          label: 'Servicios',
          route: 'services',
        ),
        MenuButton(label: 'Trabajos realizados', route: 'works'),
        MenuButton(
          label: 'Contactactame',
          route: 'contact',
        ),
      ],
    );
  }
}

class _MobileMenu extends StatelessWidget {
  const _MobileMenu();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Image(
          image: AssetImage('assets/logo-runny-dev.png'),
          width: 60,
          height: 60,
        ),
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const _MobileMenuSheet(),
              );
            },
          ),
        )
      ],
    );
  }
}

class _MobileMenuSheet extends StatelessWidget {
  const _MobileMenuSheet();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          MenuButton(
            label: 'Inicio',
            route: '/',
          ),
          MenuButton(
            label: '¿Quien soy?',
            route: 'aboutme',
          ),
          MenuButton(
            label: 'Servicios',
            route: 'services',
          ),
          MenuButton(label: 'Trabajos realizados', route: 'works'),
          MenuButton(
            label: 'Contactactame',
            route: 'contact',
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String label;
  final String route;

  const MenuButton({super.key, required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go('/$route');
        // Aquí puedes agregar la navegación correspondiente
      },
      child: Text(label),
    );
  }
}
