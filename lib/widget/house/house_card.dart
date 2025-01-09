import 'package:figma/data/filter_data.dart';
import 'package:figma/data/profile_data.dart';
import 'package:figma/screen/house_detail_screen.dart';
import 'package:figma/widget/house/house_detail.dart';
import 'package:flutter/material.dart';
import 'package:figma/widget/text/icon_text.dart';
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
            builder: (context) => HouseDetailScreen(houseModel: houseModel),
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
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                if (houseModel.owner != userData)
                  Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        houseModel.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        houseModel.address,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      if (houseModel.status != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            mapFilters[houseModel.status]!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
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
                  if (houseModel.owner != userData) SizedBox(height: 8),
                  if (houseModel.owner != userData)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              houseModel.owner,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.calendar_today),
                            SizedBox(width: 4),
                            Text('15 Oct - 27 Oct'),
                          ],
                        ),
                      ],
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
