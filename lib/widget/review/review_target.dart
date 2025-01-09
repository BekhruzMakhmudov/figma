import 'package:flutter/material.dart';
import 'package:figma/model/house_model.dart';
import 'package:figma/util/get_average_rating.dart';

class ReviewTarget extends StatelessWidget {
  final HouseModel houseModel;

  const ReviewTarget({
    super.key,
    required this.houseModel,
  });

  double get rating {
    return getAverageRating(houseModel.reviews);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              houseModel.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Text('$rating'),
                const SizedBox(width: 4),
                const Icon(Icons.star, color: Colors.amber, size: 16),
                Text('(${houseModel.reviews.length} Reviews)'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}