import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final Color? textColor;
  final double? size;
  final bool? isExpanded;
  const IconText({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    this.textColor,
    this.size,
    this.isExpanded,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: iconColor),
        SizedBox(width: 8),
        isExpanded==null? Text(
            text,
            style: TextStyle(
              fontSize: size ?? 14,
              color: textColor ?? Theme.of(context).colorScheme.onSurface,
            ),
          ):
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: size ?? 14,
              color: textColor ?? Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}
