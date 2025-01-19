import 'package:flutter/material.dart';

SnackBar snackBarFloating({
  required BuildContext context,
  required String text,
  bool? inTop,
}) {
  return SnackBar(
    backgroundColor: Theme.of(context).colorScheme.surface,
    behavior: SnackBarBehavior.floating,
    margin: inTop!=null
        ? EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 160,
            left: 10,
            right: 10,
          )
        : null,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    content: Row(
      children: [
        Icon(Icons.check, color: Colors.green),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    ),
  );
}
