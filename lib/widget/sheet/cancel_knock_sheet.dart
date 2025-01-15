import 'package:figma/data/knock_data.dart';
import 'package:figma/model/knock_model.dart';
import 'package:figma/screen/knock/knock_status_screen.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';

class CancelKnockSheet extends StatefulWidget {
  final KnockModel knockModel;
  const CancelKnockSheet({
    super.key,
    required this.knockModel,
  });

  @override
  State<CancelKnockSheet> createState() => _CancelKnockSheetState();
}

class _CancelKnockSheetState extends State<CancelKnockSheet> {
  String? selectedReason;
  CancelReason? reason;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    children: [
                      TextSpan(text: "Cancel "),
                      TextSpan(
                        text: "Knock-Knock?",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Divider(),
            const SizedBox(height: 16),
            HeaderText(
              text: 'Why do you want to cancel your Knock-Knock?',
              isBold: true,
            ),
            const SizedBox(height: 16),
            ...mapCancelReason.entries.map((entry) => RadioListTile<String>(
                  title: Text(entry.value),
                  value: entry.value,
                  groupValue: selectedReason,
                  onChanged: (value) {
                    setState(() {
                      selectedReason = entry.value;
                      reason = entry.key;
                    });
                  },
                )),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                label: Text('Describe your situation here if it is necessary'),
                hintText:
                    'Share with us why you decided to cancel your Knock-Knock. We will do our best to help you in any situation!',
                hintStyle: TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                suffix: Text(
                  '500',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.knockModel.status = KnockStatus.declined;
                    widget.knockModel.reason = reason;
                    widget.knockModel.additional = _descriptionController.text;
                  });
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KnockStatusScreen(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Cancel Knock-Knock'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
