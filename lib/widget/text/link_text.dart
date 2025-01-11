import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const LinkText({super.key, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue,
          decorationColor: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
