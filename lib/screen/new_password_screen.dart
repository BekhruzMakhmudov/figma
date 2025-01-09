import 'package:figma/frame/form_frame.dart';
import 'package:figma/screen/app_tour_screen.dart';
import 'package:figma/screen/sign_in_screen.dart';
import 'package:figma/screen/success_screen.dart';
import 'package:figma/widget/form/form_button.dart';
import 'package:figma/widget/form/form_title.dart';
import 'package:figma/widget/form/requirement_password.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  final bool? inSignUp;
  const NewPasswordScreen({super.key, this.inSignUp});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return FormFrame(
      hasAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormTitle(
                  title: (widget.inSignUp == null) ? 'New password' : 'Sign up',
                  subtitle: '03/03',
                  inSignUp: widget.inSignUp),
              const SizedBox(height: 24),
              RequirementPassword(text: _newPasswordController.text),
              const SizedBox(height: 24),
              TextFormField(
                controller: _newPasswordController,
                obscureText: obscureNewPassword,
                onChanged: (value) {
                  setState(() {
                    _newPasswordController.text = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Set up password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureNewPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          obscureNewPassword = !obscureNewPassword;
                        },
                      );
                    },
                  ),
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
                obscureText: obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'Confirm password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          obscureConfirmPassword = !obscureConfirmPassword;
                        },
                      );
                    },
                  ),
                ),
                validator: (value) {
                  if (value != _newPasswordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              FormButton(
                text: (widget.inSignUp == null) ? 'Save' : 'Create Account',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (widget.inSignUp == null)
                            ? SuccessScreen(
                                text: "Password has been change successfully",
                                buttonText: "Sign in",
                                nextScreen: SignInScreen(),
                              )
                            : AppTourScreen(),
                      ),
                      (route)=>false,
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
      ),
    );
  }
}
