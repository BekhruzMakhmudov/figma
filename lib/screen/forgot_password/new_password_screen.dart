import 'package:figma/screen/sign_in_screen.dart';
import 'package:figma/screen/success_screen.dart';
import 'package:figma/widget/form_button.dart';
import 'package:figma/widget/form_title.dart';
import 'package:figma/widget/requirement_password.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormTitle(title: 'New password', subtitle: '03/03'),
              const SizedBox(height: 24),
              RequirementPassword(text: _passwordController.text),
              const SizedBox(height: 24),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _passwordController.text = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Set up password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.check, color: Colors.green),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (!RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{8,}$')
                      .hasMatch(value)) {
                    return 'Password must meet all requirements';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.check, color: Colors.green),
                ),
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              FormButton(
                text: 'Save',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuccessScreen(
                          text: "Password has been change successfully",
                          buttonText: "Sign in",
                          nextScreen: SignInScreen(),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
