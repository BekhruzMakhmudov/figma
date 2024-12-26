import 'package:flutter/material.dart';

Color getValidationColor({
  required BuildContext context,
  required bool isValid,
  required bool isEmpty,
}) {
  if (!isValid) {
    return Theme.of(context).colorScheme.error;
  } else if (isValid && !isEmpty) {
    return Colors.green;
  } else {
    return Theme.of(context).colorScheme.onSurface;
  }
}
