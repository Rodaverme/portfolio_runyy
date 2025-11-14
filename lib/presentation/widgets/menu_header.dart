import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuHeader extends StatelessWidget {
  final void Function(String path)? onSectionSelected;
  const MenuHeader({super.key, this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.infinity,
      height: 150,
      child: isMobile
          ? _MobileMenu(
              onSectionSelected: onSectionSelected,
            )
          : _DesktopMenu(
              onSectionSelected: onSectionSelected,
            ),
    );
  }
}

class _DesktopMenu extends StatelessWidget {
  final void Function(String path)? onSectionSelected;
  const _DesktopMenu({this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image(
          image: AssetImage('assets/RunyyDev_logo_transparent.png'),
          width: 100,
          height: 80,
        ),
        MenuButton(
          label: 'Inicio',
          route: '/',
          onTap: () => onSectionSelected?.call('/'),
        ),
        MenuButton(
          label: '¿Quién soy?',
          route: 'aboutme',
          onTap: () => onSectionSelected?.call('/aboutme'),
        ),
        MenuButton(
          label: 'Servicios',
          route: 'services',
          onTap: () => onSectionSelected?.call('/services'),
        ),
        MenuButton(
          label: 'Trayectoria',
          route: 'trayectoria',
          onTap: () => onSectionSelected?.call('/trayectoria'),
        ),
        MenuButton(
          label: 'Trabajos realizados',
          route: 'works',
          onTap: () => onSectionSelected?.call('/works'),
        ),
        MenuButton(
          label: 'Contáctame',
          route: 'contact',
          onTap: () => onSectionSelected?.call('/contact'),
        ),
      ],
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final void Function(String path)? onSectionSelected;
  const _MobileMenu({this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Image(
          image: AssetImage('assets/RunyyDev_logo_transparent.png'),
          width: 80,
          height: 280,
        ),
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => _MobileMenuSheet(
                  onSectionSelected: onSectionSelected,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class _MobileMenuSheet extends StatelessWidget {
  final void Function(String path)? onSectionSelected;
  const _MobileMenuSheet({this.onSectionSelected});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MenuButton(
            label: 'Inicio',
            route: '/',
            onTap: () => onSectionSelected?.call('/'),
          ),
          MenuButton(
            label: '¿Quién soy?',
            route: 'aboutme',
            onTap: () => onSectionSelected?.call('/aboutme'),
          ),
          MenuButton(
            label: 'Servicios',
            route: 'services',
            onTap: () => onSectionSelected?.call('/services'),
          ),
          MenuButton(
            label: 'Trabajos realizados',
            route: 'works',
            onTap: () => onSectionSelected?.call('/works'),
          ),
          MenuButton(
            label: 'Contáctacme',
            route: 'contact',
            onTap: () => onSectionSelected?.call('/contact'),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String label;
  final String route;
  final VoidCallback? onTap;

  const MenuButton(
      {super.key, required this.label, required this.route, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap ?? () => context.go('$route'),
      child: Text(label),
    );
  }
}
