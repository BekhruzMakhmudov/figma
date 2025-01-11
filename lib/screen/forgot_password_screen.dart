import 'package:figma/frame/form_frame.dart';
import 'package:figma/screen/verification_screen.dart';
import 'package:figma/widget/form/form_button.dart';
import 'package:figma/widget/form/form_title.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FormFrame(
      hasAppBar: true,
      body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormTitle(title: "Forgot password?", subtitle: "01/03"),
              const SizedBox(height: 24),
              Text(
                'Enter registered e-mail and we will send you an email to restore your password.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(color: Colors.red),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  if (!RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              FormButton(
                text: "Restore",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerificationScreen(),
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