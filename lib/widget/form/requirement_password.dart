import 'package:flutter/material.dart';

class RequirementPassword extends StatelessWidget {
  final String text;
  const RequirementPassword({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your password should contain:",
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildRequirementIcon(
                context, "A", "1 capital", RegExp(r'[A-Z]').hasMatch(text)),
            _buildRequirementIcon(context, "8+", "characters", text.length > 7),
            _buildRequirementIcon(
                context, "№", "1 number", RegExp(r'\d').hasMatch(text)),
          ],
        ),
      ],
    );
  }
}

Widget _buildRequirementIcon(
    BuildContext context, String iconText, String description, bool contain) {
  return Column(
    children: [
      Text(
        iconText,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: contain
                  ? Colors.blue
                  : Theme.of(context).colorScheme.onSurface,
            ),
      ),
      SizedBox(height: 8),
      Text(
        description,
        style: TextStyle(
          color:
              contain ? Colors.blue : Theme.of(context).colorScheme.onSurface,
        ),
      ),
    ],
  );
}
