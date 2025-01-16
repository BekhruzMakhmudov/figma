import 'package:figma/widget/review/review_card.dart';
import 'package:flutter/material.dart';
import 'package:figma/model/review_model.dart';

class ReviewUser extends StatelessWidget {
  final ReviewModel reviewModel;
  const ReviewUser({super.key, required this.reviewModel});
  @override
  Widget build(BuildContext context) {
    double iconSize=25;
    Color iconColor=Colors.amber;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Row(
          children: List.generate(
            5,
            (index) {
              if (index < reviewModel.rating.floor()) {
                // Full star
                return Icon(
                  Icons.star,
                  color: iconColor,
                  size: iconSize,
                );
              } else if (index < reviewModel.rating &&
                  reviewModel.rating - index >= 0.5) {
                // Half star
                return Icon(
                  Icons.star_half,
                  color: iconColor,
                  size: iconSize,
                );
              } else {
                // Empty star
                return Icon(
                  Icons.star_border,
                  color: iconColor,
                  size: iconSize,
                );
              }
            },
          ),
        ),
        SizedBox(height: 12),
        if (reviewModel.title.isNotEmpty)
          Text(
            reviewModel.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        if (reviewModel.content.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              reviewModel.content,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ReviewCard(
          image: reviewModel.author.avatar,
          title: reviewModel.author.name,
          subtitle: Text(
            reviewModel.date,
            style: TextStyle(color: Colors.grey),
          ),
          isActive: reviewModel.author.isActive,
        ),
      ],
    );
  }
}
