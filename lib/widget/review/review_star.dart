import 'package:flutter/material.dart';

class ReviewStar extends StatelessWidget {
  final double rating;
  final Color color;
  final double size;
  const ReviewStar({
    super.key,
    required this.rating,
    required this.color,
    required this.size,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) {
          if (index < rating.floor()) {
            // Full star
            return Icon(
              Icons.star,
              color: color,
              size: size,
            );
          } else if (index < rating && rating - index >= 0.5) {
            // Half star
            return Icon(
              Icons.star_half,
              color: color,
              size: size,
            );
          } else {
            // Empty star
            return Icon(
              Icons.star_border,
              color: color,
              size: size,
            );
          }
        },
      ),
    );
  }
}
