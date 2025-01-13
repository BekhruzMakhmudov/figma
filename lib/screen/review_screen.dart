import 'package:figma/data/house_data.dart';
import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/widget/review/review_house.dart';
import 'package:figma/widget/review/review_user.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:figma/model/review_model.dart';
import 'package:figma/data/user_data.dart';

class ReviewScreen extends StatelessWidget {
  final List<ReviewModel> reviews;

  const ReviewScreen({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    final yourReviews =
        reviews.where((review) => review.author == users[0]).toList();
    return DefaultTabController(
      length: 2,
      child: NavigationFrame(
        index: 2,
        appBar: AppBar(
          title: HeaderText(
            text: "Reviews",
            isBold: true,
            isLarge: true,
          ),
          bottom: TabBar(
            indicator: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            labelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'Reviews (${reviews.length})'),
              Tab(text: 'Your reviews (${yourReviews.length})'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            (reviews.isEmpty)
                ? EmptyStateWidget()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReviewHouse(
                          houseModel: houses[0],
                        ),
                        const SizedBox(height: 16),
                        ...reviews.map(
                          (review) => ReviewUser(reviewModel: review),
                        ),
                      ],
                    ),
                  ),
            (yourReviews.isEmpty)
                ? EmptyStateWidget()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...yourReviews.map((review) => Column(
                            children: [
                              ReviewHouse(houseModel: houses[0]),
                              ReviewUser(reviewModel: review),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No results found'));
  }
}
