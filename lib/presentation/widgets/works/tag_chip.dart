import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String text;
  const TagChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Chip(
      label: Text(text),
      backgroundColor: isDark ? Colors.white10 : Colors.grey.shade200,
      labelStyle: TextStyle(
        color: isDark ? Colors.white : Colors.black87,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
