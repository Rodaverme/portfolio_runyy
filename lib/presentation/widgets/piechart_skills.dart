import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class PiechartSkills extends StatefulWidget {
  const PiechartSkills({super.key});

  @override
  State<PiechartSkills> createState() => _PiechartSkillsState();
}

class _PiechartSkillsState extends State<PiechartSkills> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions || pieTouchResponse?.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex = pieTouchResponse!.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          sections: _showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> _showingSections() {
    final data = [
      {'title': 'Flutter', 'value': 5, 'color': Colors.blue},
      {'title': 'Dart', 'value': 5, 'color': Colors.orange},
      {'title': 'Java', 'value': 3, 'color': Colors.green},
      {'title': 'Python', 'value': 2, 'color': Colors.red},
      {'title': 'UI/UX', 'value': 3, 'color': Colors.purple},
      {'title': 'Firebase', 'value': 3, 'color': Colors.brown},
      {'title': 'SQL', 'value': 2, 'color': Colors.cyan},
      {'title': 'NoSQL', 'value': 2, 'color': Colors.pink},
    ];

    return List.generate(data.length, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 20.0 : 16.0;
      final double radius = isTouched ? 120.0 : 100.0;
      return PieChartSectionData(
        color: data[i]['color'] as Color,
        value: data[i]['value'] as double,
        title: data[i]['title'] as String,
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    });
  }

  }
