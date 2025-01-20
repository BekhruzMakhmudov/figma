import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? colorText;
  final Color? background;
  const FormButton({
    super.key,
    required this.text,
    required this.onTap,
    this.colorText=Colors.white,
    this.background=Colors.blue,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style:
            Theme.of(context).textTheme.bodyLarge?.copyWith(color: colorText),
      ),
    );
  }
}
