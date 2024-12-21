import 'package:figma/screen/sign_in_screen.dart';
import 'package:figma/widget/link_text.dart';
import 'package:figma/widget/requirement_password.dart';
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
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _verificationController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String selectedCountryCode = '+1';
  TextEditingController phoneController = TextEditingController();

  final List<String> countryCodes = ['+1', '+44', '+91', '+61', '+81'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: currentStep,
        onStepContinue: () {
          if (currentStep < 2) {
            if (_formKey1.currentState?.validate() ?? false) {
              setState(() {
                currentStep++;
              });
            }
          } else if (_formKey2.currentState?.validate() ?? false) {}
        },
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() {
              currentStep--;
            });
          }
        },
        steps: _getSteps(),
        controlsBuilder: (context, details) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text("Already a member?",
                      style: Theme.of(context).textTheme.headlineSmall),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sing in",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4),
              ElevatedButton(
                onPressed: currentStep == 1 && isVerificationCodeEmpty
                    ? () {}
                    : details.onStepContinue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: currentStep == 1 && isVerificationCodeEmpty
                      ? Colors.grey
                      : Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  switch (currentStep) {
                    0 => "Agree and continue",
                    2 => "Create account",
                    _ => "Next"
                  },
                ),
              ),
              SizedBox(height: 6),
              if (currentStep == 0)
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "By continuing you agree with our ",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      linkText(text: "terms & conditions", onTap: () {}),
                      TextSpan(
                        text: " and ",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      linkText(text: "privacy policy", onTap: () {}),
                    ],
                  ),
                )
              else
                TextButton.icon(
                  onPressed: details.onStepCancel,
                  icon:
                      const Icon(Icons.keyboard_arrow_left, color: Colors.blue),
                  label: const Text(
                    "Back",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  List<Step> _getSteps() {
    return [
      ////////////////////////////////////////////////////////////////
      Step(
        title: Container(),
        isActive: currentStep >= 0,
        content: Form(
          key: _formKey1,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              ],
            ),
          ),
        ),
      ),
      ////////////////////////////////////////////////////////////////
      Step(
        title: Container(),
        isActive: currentStep >= 1,
        content: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter verification code from received e-mail",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _verificationController,
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      isVerificationCodeEmpty = true;
                    });
                  } else if (isVerificationCodeEmpty) {
                    setState(() {
                      isVerificationCodeEmpty = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  labelText: "Verification code",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "Didn't receive an email? Check your spam folder or ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    linkText(
                        text: "resend verification e-mail in 00:59",
                        onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ////////////////////////////////////////////////////////////////
      Step(
        title: Container(),
        isActive: currentStep >= 2,
        content: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Form(
            key: _formKey2,
            child: Column(
              children: [
                RequirementPassword(text:_passwordController.text),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  onChanged: (value) {
                    setState(() {
                      _passwordController.text = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    String pattern = r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$';
                    RegExp regExp = RegExp(pattern);
                    if (!regExp.hasMatch(value)) {
                      return 'Password must have 1 capital, 8+ characters, 1 number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Set up password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _obscurePassword = !_obscurePassword;
                          },
                        );
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirm,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Confirm password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _obscureConfirm = !_obscureConfirm;
                          },
                        );
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];
  }
}
