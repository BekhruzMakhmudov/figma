import 'package:figma/frame/form_frame.dart';
import 'package:figma/screen/form/new_password_screen.dart';
import 'package:figma/widget/form/form_button.dart';
import 'package:figma/widget/form/form_title.dart';
import 'package:figma/widget/text/link_text.dart';
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
    return FormFrame(
      hasAppBar: true,
      body: Column(
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
              Wrap(
                children: [
                  Text("Didn't receive an email? Check your spam folder or "),
                  LinkText(
                      text: "resend verification e-mail in 00:59",
                      onTap: () {}),
                ],
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
                          NewPasswordScreen(inSignUp: widget.inSignUp),
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
    );
  }
}
