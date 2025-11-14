import 'package:flutter/material.dart';

class DesktopPreview extends StatelessWidget {
  final String image;
  const DesktopPreview({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage('assets/loading.gif'),
      image: NetworkImage(image),
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
