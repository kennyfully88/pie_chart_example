import 'package:flutter/widgets.dart';
import 'package:pie_chart_example/pie_chart/chart_area.dart';
import 'package:pie_chart_example/pie_chart/value_label.dart';

class PieChart extends StatefulWidget {
  const PieChart({
    super.key,
    this.title = '',
    required this.value,
    required this.maxValue,
  });

  final String title;

  /// This value will show in the middle of the chart
  final double value;

  /// This max value is needed to show the chart correctly
  final double maxValue;

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart>
    with SingleTickerProviderStateMixin {
  /// This is needed to show the chart correctly
  late final double chartAreaPercentValue = widget.value / widget.maxValue;

  /// This is the animation
  late final Animation _pieChartAnimation;

  /// This controls the animation
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _pieChartAnimation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.title),
        SizedBox(
          width: 256.0,
          height: 256.0,
          child: Stack(
            children: [
              ChartArea(
                  value: _pieChartAnimation.value * chartAreaPercentValue),
              ValueLabel(value: _pieChartAnimation.value * widget.value),
            ],
          ),
        ),
      ],
    );
  }
}
