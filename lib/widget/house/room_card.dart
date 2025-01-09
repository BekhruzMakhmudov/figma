import 'package:figma/widget/text/icon_text.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final IconData icon;
  final String mainText;
  final List<String> description;
  const RoomCard(
      {super.key,
      required this.icon,
      required this.mainText,
      required this.description});
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
              IconText(icon: icon, text: mainText),
              ...description.map(
                (text) => Text(
                  text,
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
