import 'package:figma/data/user_data.dart';
import 'package:figma/screen/house/house_detail_screen.dart';
import 'package:figma/widget/check_icon.dart';
import 'package:figma/widget/chip_status.dart';
import 'package:figma/widget/house/house_property.dart';
import 'package:figma/widget/text/header_text.dart';
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
            SizedBox(
              height: 200,
              child: GridTile(
                header: (widget.houseModel.ownerId != users[0].id)
                    ? Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: widget.onTap,
                          icon: Icon(
                            widget.houseModel.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                      )
                    : null,
                footer: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  child: (widget.houseModel.isVerified!)
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CheckIcon(color: Colors.blue),
                                SizedBox(width: 4),
                                Text(
                                  'Verified',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            IconText(
                              icon: Icons.star,
                              iconColor: Colors.yellow,
                              text: widget.houseModel.averageRating,
                              textColor: Colors.white,
                            ),
                          ],
                        )
                      : IconText(
                          icon: Icons.hourglass_top,
                          iconColor: Colors.white,
                          text: "Waiting for verification",
                          textColor: Colors.white,
                        ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.houseModel.image,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.inKnock == null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.houseModel.address.districtCity,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        if (widget.houseModel.status != null)
                          ChipStatus(status: widget.houseModel.status!),
                      ],
                    ),
                  if (widget.inKnock == null)
                    HeaderText(
                      text: widget.houseModel.fullTitle,
                      isBold: true,
                      isLarge: false,
                    ),
                  HouseProperty(
                    houseModel: widget.houseModel,
                  ),
                  if (widget.houseModel.ownerId != users[0].id)
                    SizedBox(height: 8),
                  if (widget.houseModel.ownerId != users[0].id)
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
                        widget.houseModel.periodRow,
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
