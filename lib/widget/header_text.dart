import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final bool? isLarge;
  final bool? isBold;
  final Color? color;
  const HeaderText({
    super.key,
    required this.text,
    this.isLarge,
    this.isBold,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    TextStyle? style;
    if (isLarge == null) {
      style = Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: color,
            fontWeight: (isBold != null) ? FontWeight.bold : null,
          );
    } else if (isLarge ?? false) {
      style = Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: color,
            fontWeight: (isBold != null) ? FontWeight.bold : null,
          );
    } else {
      style = Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: color,
            fontWeight: (isBold != null) ? FontWeight.bold : null,
          );
    }
    return Text(
      text,
      style: style,
    );
  }
}
