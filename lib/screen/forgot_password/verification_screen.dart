import 'package:figma/screen/forgot_password/new_password_screen.dart';
import 'package:figma/widget/form_button.dart';
import 'package:figma/widget/form_title.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

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
            FormTitle(title: 'Verification code', subtitle: '02/03'),
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
            const SizedBox(height: 24),
            FormButton(
              text: 'Next',
              onTap: () {
                if (_codeController.text.length == 6) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPasswordScreen(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
