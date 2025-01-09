import 'package:figma/data/house_data.dart';
import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:figma/widget/review/review_card.dart';
import 'package:flutter/material.dart';
import 'package:figma/model/review_model.dart';
import 'package:figma/widget/review/review_target.dart';
import 'package:figma/widget/review/review_metric.dart';

class ReviewScreen extends StatelessWidget {
  final List<ReviewModel> reviews;

  const ReviewScreen({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    int yourReviews = reviews.length;
    return NavigationFrame(
      index: 2,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderText(
                text: "Reviews",
                isLarge: true,
                isBold: true,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Reviews (${reviews.length})'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        foregroundColor: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Your reviews ($yourReviews)'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ReviewTarget(
                houseModel: myHouses[0],
              ),
              const SizedBox(height: 16),
              ReviewMetric(),
              const SizedBox(height: 24),
              ...reviews.map((review) => ReviewCard(reviewModel: review)),
            ],
          ),
        ),
      ),
    );
  }
}
