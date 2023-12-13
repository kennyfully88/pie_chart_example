import 'package:flutter/widgets.dart';
import 'package:pie_chart_example/pie_chart/pie_chart.dart';

void main() {
  runApp(const PieChartExampleApp());
}

class PieChartExampleApp extends StatelessWidget {
  const PieChartExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Color(0xFF000000),
          fontFamily: 'Arial',
          fontSize: 30.0,
        ),
        child: Container(
          color: const Color(0xFFFFFFFF),
          child: const SafeArea(
            child: PieChart(
              title: 'Pie Chart Example',
              value: 777.0,
              maxValue: 1000.0,
            ),
          ),
        ),
      ),
    );
  }
}
