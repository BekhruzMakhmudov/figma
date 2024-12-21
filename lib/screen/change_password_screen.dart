import 'package:figma/screen/success_screen.dart';
import 'package:figma/widget/requirement_password.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  int _currentIndex = 3;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change password",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 35,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
              ElevatedButton(
                onPressed: () {
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
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: isValid ? Colors.blue : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Spacer(flex: 6),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue, // Active tab color
        unselectedItemColor: Colors.grey, // Inactive tab color
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Houses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Knock-knocks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget passwordFormField(String label, TextEditingController controller) {
    return TextFormField(
      obscureText: mapObscure[label]!,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
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
        border: OutlineInputBorder(),
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
