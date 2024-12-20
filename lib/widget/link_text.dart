import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

TextSpan linkText({required String text,required VoidCallback onTap}) {
  return TextSpan(
    text: text,
    recognizer: TapGestureRecognizer()..onTap = onTap,
    style: TextStyle(
      color: Colors.blue,
      decoration: TextDecoration.underline,
    ),
  );
}
