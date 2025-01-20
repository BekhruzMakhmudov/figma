import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool? isReset;
  const FormButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isReset,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: (isReset == null) ? Colors.blue : Colors.white60,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: (isReset == null) ? Colors.white : Colors.black,
              ),
        ),
      ),
    );
  }
}
