import 'package:figma/frame/form_frame.dart';
import 'package:figma/screen/verification_screen.dart';
import 'package:figma/util/get_validation_color.dart';
import 'package:figma/widget/form/form_button.dart';
import 'package:figma/widget/form/form_title.dart';
import 'package:figma/widget/text/link_text.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isValidPhone = true;
  bool isValidEmail = true;

  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final focusNode = FocusNode();
  bool isFocused = false;

  String selectedCountryCode = '+1';

  final List<String> countryCodes = ['+1', '+44', '+91', '+61', '+81'];

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormFrame(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormTitle(title: "Sign up", subtitle: "01/03", inSignUp: true),
              Spacer(flex: 3),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  hintText: "First name",
                  helperText:
                      "Most preferably is to use the same name as in the passport",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Spacer(flex: 1),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  hintText: "Last name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Spacer(flex: 3),
              TextFormField(
                controller: _emailController,
                onChanged: (value) {
                  setState(() {
                    isValidEmail = false;
                  });
                },
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
                  helperText:
                      "We will send you a verification code to this e-mail address",
                  suffixIcon: isValidEmail && _emailController.text.isNotEmpty
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: getValidationColor(
                          context: context,
                          isValid: isValidEmail,
                          isEmpty: _emailController.text.isEmpty),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: getValidationColor(
                          context: context,
                          isValid: isValidEmail,
                          isEmpty: _emailController.text.isEmpty),
                      width: 2,
                    ),
                  ),
                ),
              ),
              Spacer(flex: 1),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: getValidationColor(
                      context: context,
                      isValid: isValidPhone,
                      isEmpty: _phoneController.text.isEmpty,
                    ),
                    width: isFocused ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    DropdownButton<String>(
                      value: selectedCountryCode,
                      onChanged: (newValue) {
                        setState(() {
                          selectedCountryCode = newValue!;
                        });
                      },
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
                        controller: _phoneController,
                        focusNode: focusNode,
                        keyboardType: TextInputType.phone,
                        maxLength: 9,
                        onChanged: (value) {
                          setState(() {
                            isValidPhone = false;
                          });
                        },
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
                          suffixIcon:
                              isValidPhone && _phoneController.text.isNotEmpty
                                  ? Icon(Icons.check, color: Colors.green)
                                  : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 6),
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
              Spacer(flex: 1),
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    "By continuing you agree with our ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  linkText(text: "terms & conditions", onTap: () {}),
                  Text(
                    " and ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  linkText(text: "privacy policy", onTap: () {}),
                ],
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
