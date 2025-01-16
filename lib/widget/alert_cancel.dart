import 'package:flutter/material.dart';

class AlertCancel extends StatelessWidget {
  final String title;
  final String textButton;
  final VoidCallback onTap;
  const AlertCancel({
    super.key,
    required this.title,
    required this.textButton,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            textButton,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
