import 'package:figma/data/user_data.dart';
import 'package:figma/frame/form_frame.dart';
import 'package:figma/screen/form/forgot_password_screen.dart';
import 'package:figma/screen/form/sign_up_screen.dart';
import 'package:figma/screen/house/houses_list_screen.dart';
import 'package:figma/widget/form/form_button.dart';
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
  bool notFound = false;

  @override
  Widget build(BuildContext context) {
    return FormFrame(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          if (notFound)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Email or password is invalid',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
          FormButton(
            onTap: () {
              bool isValid = false;
              for (var user in users) {
                if (user.email == _emailController.text &&
                    user.password == _passwordController.text) {
                  isValid = true;
                  break;
                }
              }
              if (isValid) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HousesScreen(),
                  ),
                  (route) => false,
                );
              } else {
                setState(() {
                  notFound = true;
                });
              }
            },
            text: 'Sign in',
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
