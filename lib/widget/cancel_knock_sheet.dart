import 'package:flutter/material.dart';

class CancelKnockSheet extends StatefulWidget {
  const CancelKnockSheet({super.key});

  @override
  State<CancelKnockSheet> createState() => _CancelKnockSheetState();
}

class _CancelKnockSheetState extends State<CancelKnockSheet> {
  String? selectedReason;
  final TextEditingController _descriptionController = TextEditingController();

  final List<String> cancelReasons = [
    'My plans have changed',
    'I have found better place',
    'I waited too long for a respond',
    'I found that member unreliable',
    'Other',
  ];

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
                const Text(
                  'Cancel Knock-Knock?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Why do you want to cancel your Knock-Knock?',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ...cancelReasons.map((reason) => RadioListTile<String>(
                  title: Text(reason),
                  value: reason,
                  groupValue: selectedReason,
                  onChanged: (value) {
                    setState(() {
                      selectedReason = value;
                    });
                  },
                )),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
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
                onPressed: () {},
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
