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
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: houseModel.image,
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
                Text(houseModel.averageRating),
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
