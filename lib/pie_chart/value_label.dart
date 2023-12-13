import 'package:flutter/widgets.dart';

class ValueLabel extends StatefulWidget {
  const ValueLabel({
    super.key,
    required this.value,
  });

  final double value;

  @override
  State<ValueLabel> createState() => _ValueLabelState();
}

class _ValueLabelState extends State<ValueLabel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${widget.value.toInt()}',
        style: const TextStyle(
          color: Color(0xFF000000),
          fontSize: 42.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
