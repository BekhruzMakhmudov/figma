import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool? isBold;
  const LinkText({
    super.key,
    required this.text,
    required this.onTap,
    this.isBold,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: (isBold != null) ? FontWeight.bold : null,
          color: Colors.blue,
          decorationColor: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
