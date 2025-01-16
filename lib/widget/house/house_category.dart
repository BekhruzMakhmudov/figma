import 'package:flutter/material.dart';

class HouseCategory extends StatelessWidget {
  final String title;
  final List<Widget> content;
  const HouseCategory({
    super.key,
    required this.title,
    required this.content,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content,
        ),
      ],
    );
  }
}
