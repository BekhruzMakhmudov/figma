import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const FormTitle({super.key, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
