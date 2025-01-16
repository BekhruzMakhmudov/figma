import 'package:figma/model/review_model.dart';
import 'package:figma/widget/profile_card.dart';
import 'package:figma/widget/review/review_slider.dart';
import 'package:flutter/material.dart';
import 'package:figma/model/house_model.dart';

class ReviewHouse extends StatelessWidget {
  final HouseModel houseModel;

  const ReviewHouse({
    super.key,
    required this.houseModel,
  });

  @override
  Widget build(BuildContext context) {
    final mapRating = houseModel.mapRating;
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProfileCard(
              size: 50,
              color: houseModel.image!,
              title: Text(houseModel.fullTitle),
              subtitle: Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(
                    houseModel.averageRating,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '(${houseModel.reviews.length} Reviews)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        ...Property.values.map(
          (property) => ReviewSlider(
            text: mapProperty[property]!,
            value: mapRating[property]!,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
