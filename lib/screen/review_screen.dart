import 'package:figma/data/house_data.dart';
import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/model/house_model.dart';
import 'package:figma/widget/review/review_house.dart';
import 'package:figma/widget/review/review_user.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:figma/data/user_data.dart';
import 'package:figma/data/review_data.dart';

class ReviewScreen extends StatefulWidget {
  final HouseModel? houseModel;

  const ReviewScreen({
    super.key,
    this.houseModel,
  });

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = widget.houseModel == null ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    final houseReviews =
        (widget.houseModel == null) ? [] : widget.houseModel!.reviews;
    final yourReviews =
        reviews.where((review) => review.author == users[0]).toList();
    return DefaultTabController(
      initialIndex: _tabController.index,
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
            controller: _tabController,
            onTap: (index) {
              if (widget.houseModel == null) {
                _tabController.index = _tabController.previousIndex;
              }
            },
            indicator: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            labelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: 'Reviews (${houseReviews.length})'),
              Tab(text: 'Your reviews (${yourReviews.length})'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            (houseReviews.isEmpty)
                ? Center(child: Text('No results found'))
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReviewHouse(
                          houseModel: widget.houseModel!,
                        ),
                        const SizedBox(height: 16),
                        ...houseReviews.map(
                          (review) => ReviewUser(reviewModel: review),
                        ),
                      ],
                    ),
                  ),
            (yourReviews.isEmpty)
                ? Center(child: Text('No results found'))
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...yourReviews.map(
                          (review) => Column(
                            children: [
                              ReviewHouse(houseModel: houses[review.houseId]),
                              ReviewUser(reviewModel: review),
                              SizedBox(height: 12),
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
