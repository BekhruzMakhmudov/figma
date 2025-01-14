import 'package:figma/data/filter_data.dart';
import 'package:figma/data/user_data.dart';
import 'package:figma/screen/house/house_detail_screen.dart';
import 'package:figma/widget/house/house_detail.dart';
import 'package:flutter/material.dart';
import 'package:figma/widget/text/icon_text.dart';
import 'package:figma/model/house_model.dart';

class HouseCard extends StatefulWidget {
  final HouseModel houseModel;
  final VoidCallback onTap;
  final bool? inKnock;
  const HouseCard({
    super.key,
    required this.houseModel,
    required this.onTap,
    this.inKnock,
  });

  @override
  State<HouseCard> createState() => _HouseCardState();
}

class _HouseCardState extends State<HouseCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HouseDetailScreen(houseModel: widget.houseModel),
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
                    color: widget.houseModel.image,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                if (widget.houseModel.owner != users[0])
                  Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: widget.onTap,
                      icon: Icon(
                        widget.houseModel.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ),
                if (widget.houseModel.isVerified)
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
                if (widget.houseModel.isVerified)
                  Positioned(
                    bottom: 8,
                    right: 9,
                    child: IconText(
                      icon: Icons.star,
                      iconColor: Colors.yellow,
                      text: widget.houseModel.averageRating,
                      textColor: Colors.white,
                    ),
                  ),
                if (!widget.houseModel.isVerified)
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
                  if(widget.inKnock==null) Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.houseModel.cityCountry,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      if (widget.houseModel.status != null)
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
                            mapFilters[widget.houseModel.status]!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  if(widget.inKnock==null) const SizedBox(height: 4),
                  if(widget.inKnock==null) Text(
                    widget.houseModel.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if(widget.inKnock==null) const SizedBox(height: 8),
                  HouseDetail(
                    guests: widget.houseModel.guests,
                    bathrooms: widget.houseModel.bathrooms,
                    bedrooms: widget.houseModel.bedrooms,
                    beds: widget.houseModel.beds,
                  ),
                  if (widget.houseModel.owner != users[0]) SizedBox(height: 8),
                  if (widget.houseModel.owner != users[0])
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: widget.houseModel.owner.avatar,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.houseModel.owner.name,
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
