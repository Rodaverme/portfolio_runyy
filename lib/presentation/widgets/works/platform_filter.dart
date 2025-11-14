import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_runny/presentation/sections/works_done.dart';


class PlatformFilter extends ConsumerWidget {
  const PlatformFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(projectFilterProvider);
    final notifier = ref.read(projectFilterProvider.notifier);
    final options = ['Todos', 'Android', 'iOS', 'Desktop', 'Web'];
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: options.map((opt) {
        final isSelected = selected == opt;
        return ChoiceChip(
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              opt,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? Colors.white
                    : (isDark ? Colors.white70 : Colors.black87),
              ),
            ),
          ),
          selected: isSelected,
          selectedColor: theme.colorScheme.primary,
          backgroundColor: isDark ? Colors.white10 : Colors.grey.shade200,
          onSelected: (_) => notifier.state = opt,
        );
      }).toList(),
    );
  }
}
