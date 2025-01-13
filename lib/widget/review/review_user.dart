import 'package:flutter/material.dart';
import 'package:figma/model/review_model.dart';

class ReviewUser extends StatelessWidget {
  final ReviewModel reviewModel;
  const ReviewUser({super.key, required this.reviewModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              index < reviewModel.rating ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          reviewModel.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          reviewModel.content,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reviewModel.author.name,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  reviewModel.date,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
