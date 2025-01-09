import 'package:flutter/material.dart';
import 'package:figma/widget/text/icon_text.dart';

class HouseDetail extends StatelessWidget {
  final int guests;
  final int bedrooms;
  final int beds;
  final int bathrooms;
  const HouseDetail({
    super.key,
    required this.guests,
    required this.bathrooms,
    required this.bedrooms,
    required this.beds,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Wrap(
        spacing: 10.0, // Horizontal spacing
        runSpacing: 10.0,
        children: [
          IconText(
              icon: Icons.person, text: "$guests guests"),
          Text("•"),
          IconText(
              icon: Icons.bed, text: "$bedrooms bedrooms"),
          Text("•"),
          IconText(
              icon: Icons.king_bed, text: "$beds beds"),
          Text("•"),
          IconText(
              icon: Icons.bathroom,
              text: "$bathrooms bathroom"),
        ],
      ),
    );
  }
}
