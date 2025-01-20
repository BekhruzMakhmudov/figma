import 'package:figma/widget/form/form_button.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final String text;
  final String buttonText;
  final Widget? nextScreen;
  const SuccessScreen({
    super.key,
    required this.text,
    required this.buttonText,
    this.nextScreen,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 16),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            FormButton(
              onTap: () => (nextScreen == null)
                  ? Navigator.of(context).pop()
                  : Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => nextScreen!),
                    ),
              text: buttonText,
              colorText: Colors.blue,
              background: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
