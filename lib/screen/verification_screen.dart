import 'package:figma/screen/new_password_screen.dart';
import 'package:figma/widget/form_button.dart';
import 'package:figma/widget/form_title.dart';
import 'package:figma/widget/link_text.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  final bool? inSignUp;
  const VerificationScreen({super.key, this.inSignUp});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormTitle(
                title:
                    (widget.inSignUp == null) ? 'Verification code' : 'Sign up',
                subtitle: '02/03',
                inSignUp: widget.inSignUp),
            const SizedBox(height: 24),
            Text(
              'Enter verification code from received e-mail.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '------',
              ),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            const SizedBox(height: 10),
            if (widget.inSignUp ?? false)
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "Didn't receive an email? Check your spam folder or ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    linkText(
                        text: "resend verification e-mail in 00:59",
                        onTap: () {}),
                  ],
                ),
              ),
            const SizedBox(height: 24),
            FormButton(
              text: 'Next',
              onTap: () {
                if (_codeController.text.length == 6) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const NewPasswordScreen(inSignUp: true),
                    ),
                  );
                }
              },
            ),
            if (widget.inSignUp ?? false)
              Center(
                child: TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.blue,
                    size: 30,
                  ),
                  label: Text(
                    "Back",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.blue),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
