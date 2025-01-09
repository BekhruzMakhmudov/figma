import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';

class Expansion extends StatelessWidget {
  final String text;
  final List<Widget> children;
  const Expansion({super.key, required this.text, required this.children});
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: HeaderText(
        text:text,
        isLarge: false,
        isBold: true,
      ),
      children: children,
    );
  }
}
