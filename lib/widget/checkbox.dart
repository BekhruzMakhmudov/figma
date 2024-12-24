import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  final String text;
  final bool? isBold;
  const CheckBox({super.key, required this.text, this.isBold});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.text,
        style: (widget.isBold!=null)? TextStyle(fontWeight: FontWeight.bold):null,
      ),
      value: isChecked,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value ?? false;
        });
      },
    );
  }
}
