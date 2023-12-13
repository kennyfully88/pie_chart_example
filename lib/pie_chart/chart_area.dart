import 'dart:math';

import 'package:flutter/widgets.dart';

class ChartArea extends StatelessWidget {
  const ChartArea({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PieChartPainter(value: value),
      size: const Size(256.0, 256.0),
    );
  }
}

/// CustomPainter
class PieChartPainter extends CustomPainter {
  PieChartPainter({required this.value});

  late final double value;

  /// This is the gray area for your chart
  final Paint backgroundPaint = Paint()
    ..color = const Color(0xFFEAEAF4)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 32;

  /// This is the blue area for your chart
  final Paint foregroundPaint = Paint()
    ..color = const Color(0xFF376AF6)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 32;

  /// This function draws the circles
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(
          size.width / 2,
          size.height / 2,
        ),
        radius: 112,
      ),
      3 * pi / 2,
      2 * pi,
      false,
      backgroundPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(
          size.width / 2,
          size.height / 2,
        ),
        radius: 112,
      ),
      3 * pi / 2,
      (value * 2) * pi,
      false,
      foregroundPaint,
    );
  }

  /// This function tells the CustomPainter to redraw when values are changed
  /// compared to the previous values
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
