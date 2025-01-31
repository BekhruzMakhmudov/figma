import 'package:figma/data/review_data.dart';
import 'package:figma/data/user_data.dart';
import 'package:figma/model/review_model.dart';
import 'package:figma/screen/knock/knock_status_screen.dart';
import 'package:figma/widget/review/review_slider.dart';
import 'package:flutter/material.dart';

class RateAccommodationSheet extends StatefulWidget {
  final int houseId;
  const RateAccommodationSheet({
    super.key,
    required this.houseId,
  });

  @override
  State<RateAccommodationSheet> createState() => _RateAccommodationSheetState();
}

class _RateAccommodationSheetState extends State<RateAccommodationSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final rating = {
    Property.cleanliness: 0.0,
    Property.communication: 0.0,
    Property.nearPlace: 0.0,
    Property.neighbours: 0.0,
    Property.amenities: 0.0,
  };
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.house_outlined,
                  color: Colors.blue,
                  size: 50,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'How was your stay?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Please, rate the accommodation',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            const SizedBox(height: 16),
            ...rating.entries.map(
              (entry) => ReviewSlider(
                text: mapProperty[entry.key]!,
                value: rating[entry.key]!,
                onChanged: (value) {
                  setState(
                    () {
                      rating[entry.key] = value;
                    },
                  );
                },
              ),
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
                hintText: 'Write a title...',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Message',
                border: const OutlineInputBorder(),
                hintText: 'Write a message...',
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
                  reviews.add(
                    ReviewModel(
                      title: _titleController.text,
                      content: _messageController.text,
                      author: users[0],
                      houseId: widget.houseId,
                      date: '12.09.2020',
                      mapProperty: {
                        Property.cleanliness: rating[Property.cleanliness]!,
                        Property.communication: rating[Property.communication]!,
                        Property.nearPlace: rating[Property.nearPlace]!,
                        Property.neighbours: rating[Property.neighbours]!,
                        Property.amenities: rating[Property.amenities]!,
                      },
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KnockStatusScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Send'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
