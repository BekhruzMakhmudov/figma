import 'package:flutter/material.dart';

class FormFrame extends StatelessWidget {
  final Widget body;
  final bool? hasAppBar;
  const FormFrame({super.key, required this.body, this.hasAppBar});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: (hasAppBar != null)
          ? AppBar(
              leading: const BackButton(),
              elevation: 0,
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: body,
        ),
      ),
    );
  }
}
