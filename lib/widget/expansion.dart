import 'package:flutter/material.dart';

class Expansion extends StatelessWidget {
  final String text;
  final List<Widget> children;
  const Expansion({super.key, required this.text, required this.children});
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      children: children,
    );
  }
}
