import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool? isMain;
  const FormButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isMain,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: (isMain == null) ? Colors.blue : Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
