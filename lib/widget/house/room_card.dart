import 'package:figma/model/bed_model.dart';
import 'package:figma/widget/text/icon_text.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final int index;
  final List<BedModel> listBeds;
  const RoomCard({
    super.key,
    required this.index,
    required this.listBeds,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170, // Fixed width for each card
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconText(icon: Icons.bed, text: "Room ${index+1}"),
              ...listBeds.map(
                (bed) => Text(
                  '${bed.count} ${bed.size}',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
