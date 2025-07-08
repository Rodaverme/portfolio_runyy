import 'package:flutter/material.dart';

class FotterWidget extends StatelessWidget {
  const FotterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.deepPurple,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: const Center(
        child: Text(
          '© 2025 Ronald Vera | Todos los derechos reservados',
          style: TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
