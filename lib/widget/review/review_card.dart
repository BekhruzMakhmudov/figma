import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final Color image;
  final String title;
  final Widget subtitle;
  final bool? isActive;
  const ReviewCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.isActive,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: image,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            if (isActive != null)
              Positioned(
                top: 2,
                right: 2,
                child: Icon(
                  Icons.circle,
                  size: 15,
                  color: (isActive!) ? Colors.greenAccent : Colors.grey,
                ),
              ),
          ],
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle,
          ],
        ),
      ],
    );
  }
}
