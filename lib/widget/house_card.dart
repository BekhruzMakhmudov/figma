import 'package:figma/screen/house_screen.dart';
import 'package:figma/widget/house_detail.dart';
import 'package:flutter/material.dart';
import 'package:figma/widget/icon_text.dart';
import 'package:figma/model/house_model.dart';

class HouseCard extends StatelessWidget {
  final HouseModel houseModel;
  const HouseCard({super.key, required this.houseModel});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HouseScreen(houseModel: houseModel),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Container(
                    height: 200,
                    color: Colors.grey,
                  ),
                ),
                if (houseModel.isVerified)
                  Positioned(
                    bottom: 8,
                    left: 7,
                    child: IconText(
                      icon: Icons.check_circle,
                      iconColor: Colors.blue,
                      text: "Verified",
                      textColor: Colors.white,
                    ),
                  ),
                if (houseModel.isVerified)
                  Positioned(
                    bottom: 8,
                    right: 9,
                    child: IconText(
                      icon: Icons.star,
                      iconColor: Colors.yellow,
                      text: "${houseModel.rating}",
                      textColor: Colors.white,
                    ),
                  ),
                if (!houseModel.isVerified)
                  Positioned(
                    bottom: 8,
                    left: 7,
                    child: IconText(
                      icon: Icons.hourglass_top,
                      iconColor: Colors.white,
                      text: "Waiting for verification",
                      textColor: Colors.white,
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    houseModel.address,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    houseModel.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  HouseDetail(
                    guests: houseModel.guests,
                    bathrooms: houseModel.bathrooms,
                    bedrooms: houseModel.bedrooms,
                    beds: houseModel.beds,
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
