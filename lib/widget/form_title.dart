import 'package:figma/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool? inSignUp;
  const FormTitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.inSignUp,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (inSignUp ?? false)
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
          ],
        ),
        (inSignUp == null)
            ? Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            : Row(
                children: [
                  Text("Already a member?",
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sing in",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
