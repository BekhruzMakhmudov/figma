import 'package:figma/screen/verification_screen.dart';
import 'package:figma/widget/form_button.dart';
import 'package:figma/widget/form_title.dart';
import 'package:figma/widget/link_text.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int currentStep = 0;
  bool isValidPhone = true;
  bool isValidEmail = false;
  bool isVerificationCodeEmpty = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  String selectedCountryCode = '+1';
  TextEditingController phoneController = TextEditingController();

  final List<String> countryCodes = ['+1', '+44', '+91', '+61', '+81'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormTitle(title: "Sign up", subtitle: "01/03", inSignUp: true),
              const SizedBox(height: 24),
              Text(
                "Most preferably is to use the same name as in the passport",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  hintText: "First name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  hintText: "Last name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                "We will send you a verification code to this e-mail address",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      isValidEmail = false;
                    });
                    return 'Email is required';
                  }
                  String pattern =
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  setState(() {
                    isValidEmail = true;
                  });
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "E-mail",
                  suffixIcon: isValidEmail
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isValidPhone
                          ? Colors.grey
                          : Theme.of(context).colorScheme.error),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    DropdownButton<String>(
                      value: selectedCountryCode,
                      onChanged: (newValue) {
                        setState(() {
                          selectedCountryCode = newValue!;
                        });
                      },
                      style: TextStyle(
                        color: isValidPhone
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).colorScheme.error,
                      ),
                      underline: Container(),
                      items: countryCodes
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 9,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              isValidPhone = false;
                            });
                            return 'Phone number is required';
                          }
                          if (value.length != 9) {
                            setState(() {
                              isValidPhone = false;
                            });
                            return 'Phone number should be exactly 9 digits';
                          }
                          setState(() {
                            isValidPhone = true;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter phone number',
                          counterText: "",
                          isDense: true,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: isValidPhone
                                  ? Colors.grey
                                  : Theme.of(context).colorScheme.error),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              FormButton(
                  text: "Agree and continue",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VerificationScreen(inSignUp: true),
                        ),
                      );
                    }
                  }),
              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "By continuing you agree with our ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    linkText(text: "terms & conditions", onTap: () {}),
                    TextSpan(
                      text: " and ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    linkText(text: "privacy policy", onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
