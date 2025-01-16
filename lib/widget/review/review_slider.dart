import 'package:flutter/material.dart';

class ReviewSlider extends StatelessWidget {
  final String text;
  final double value;
  final ValueChanged<double> onChanged;
  const ReviewSlider({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        Row(
          children: [
            Expanded(
              child: Slider(
                min: 0,
                max: 5,
                divisions: 10,
                activeColor: Colors.amber,
                value: value,
                onChanged: onChanged,
              ),
            ),
            Text(
              value.toStringAsFixed(1),
            ),
          ],
        ),
      ],
    );
  }
}
