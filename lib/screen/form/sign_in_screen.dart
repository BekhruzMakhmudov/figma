import 'package:figma/frame/form_frame.dart';
import 'package:figma/screen/form/forgot_password_screen.dart';
import 'package:figma/screen/form/sign_up_screen.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:figma/widget/form/social_button.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  bool _obscureText = true;

  void _validateAndSignIn() {
    setState(() {
      _emailError = null;
      _passwordError = null;
      if (_emailController.text.isEmpty) {
        _emailError = 'This field is required';
      }
      if (_passwordController.text.isEmpty) {
        _passwordError = 'This field is required';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormFrame(
      body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderText(
                  text: 'Sign in',
                  isLarge: true,
                  isBold: true,
                  color: Colors.blue,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: HeaderText(
                    text: 'Sign up',
                    isLarge: true,
                    isBold: true,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(flex: 3),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _emailError,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const Spacer(flex: 1),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _passwordError,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        _obscureText = !_obscureText;
                      },
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  'Forgot password?',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey),
                ),
              ),
            ),
            const Spacer(flex: 3),
            ElevatedButton(
              onPressed: _validateAndSignIn,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: HeaderText(
                text: 'Sign in',
                isLarge: false,
                color: Colors.white,
              ),
            ),
            const Spacer(flex: 3),
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('or sign in with',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey)),
                ),
                const Expanded(child: Divider()),
              ],
            ),
            const Spacer(flex: 3),
            SocialButton(
                text: 'Sign in with Google', icon: Icons.email, onTap: () {}),
            const Spacer(flex: 1),
            SocialButton(
                text: 'Sign in with Facebook',
                icon: Icons.facebook,
                onTap: () {}),
            const Spacer(flex: 1),
            SocialButton(
                text: 'Sign in with Apple', icon: Icons.apple, onTap: () {}),
            const Spacer(flex: 3),
          ],
        ),
    );
  }
}
