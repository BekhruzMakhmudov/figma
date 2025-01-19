import 'package:flutter/material.dart';

class CheckIcon extends StatelessWidget {
  final Color color;
  const CheckIcon({super.key, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}
