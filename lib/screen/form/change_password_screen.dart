import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/screen/success_screen.dart';
import 'package:figma/widget/form/form_button.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:figma/widget/form/requirement_password.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isValid = false;

  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final mapObscure = {
    "Current Password": true,
    "New Password": true,
    "Confirm Password": true,
  };

  @override
  Widget build(BuildContext context) {
    return NavigationFrame(
      index: 3,
      appBar: AppBar(
        title: HeaderText(
          text: "Change password",
          isLarge: false,
          isBold: true,
        ),
        leading: BackButton(),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 2),
            passwordFormField("Current Password", _oldPasswordController),
            Spacer(flex: 2),
            RequirementPassword(text: _newPasswordController.text),
            Spacer(flex: 2),
            passwordFormField("New Password", _newPasswordController),
            Spacer(flex: 1),
            passwordFormField("Confirm Password", _confirmPasswordController),
            Spacer(flex: 4),
            FormButton(
              onTap: () {
                if (isValid) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SuccessScreen(
                        text: "Password has been changed successfully",
                        buttonText: "Back to profile",
                      ),
                    ),
                  );
                }
              },
              background: isValid ? Colors.blue : Colors.blue.withAlpha(60),
              text: "Continue",
            ),
            Spacer(flex: 6),
          ],
        ),
      ),
    );
  }

  Widget passwordFormField(String label, TextEditingController controller) {
    return TextFormField(
      obscureText: mapObscure[label]!,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        String pattern = r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$';
        RegExp regExp = RegExp(pattern);
        if (label == "New Password" && !regExp.hasMatch(value)) {
          return 'Password must have 1 capital, 8+ characters, 1 number';
        }
        if (label == "Confirm Password" &&
            value != _newPasswordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
      onChanged: (value) {
        if (_oldPasswordController.text.isNotEmpty &&
            _newPasswordController.text.isNotEmpty &&
            _confirmPasswordController.text.isNotEmpty) {
          if (_formKey.currentState?.validate() ?? false) {
            setState(() {
              isValid = true;
            });
          } else if (isValid) {
            setState(() {
              isValid = false;
            });
          }
        }
        if (label == "New Password") {
          setState(() {
            _newPasswordController.text = value;
          });
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            mapObscure[label]! ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(
              () {
                mapObscure[label] = !mapObscure[label]!;
              },
            );
          },
        ),
        labelText: label,
      ),
    );
  }
}
