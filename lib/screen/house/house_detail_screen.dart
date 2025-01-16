import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/model/house_model.dart';
import 'package:figma/widget/house/house_category.dart';
import 'package:figma/widget/house/house_detail.dart';
import 'package:figma/widget/house/room_card.dart';
import 'package:figma/widget/text/status_text.dart';
import 'package:flutter/material.dart';
import 'package:figma/data/user_data.dart';

class HouseDetailScreen extends StatefulWidget {
  final HouseModel houseModel;
  const HouseDetailScreen({super.key, required this.houseModel});
  @override
  State<HouseDetailScreen> createState() => _HouseDetailScreenState();
}

class _HouseDetailScreenState extends State<HouseDetailScreen> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final rooms = widget.houseModel.rooms;
    return NavigationFrame(
      index: 3,
      appBar: AppBar(
        title: Text("Back"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.houseModel.status != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: StatusText(status: widget.houseModel.status!),
              ),
            if (!widget.houseModel.isVerified &&
                widget.houseModel.owner != users[0])
              Text(
                'You can not Knock until the accommodation is verified',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: widget.houseModel.fullTitle,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  WidgetSpan(child: SizedBox(width: 8)),
                  if (widget.houseModel.isVerified)
                    WidgetSpan(
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 4),
            Text(
              widget.houseModel.cityCountry,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 4),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: widget.houseModel.image,
                ),
              ),
            ),
            SizedBox(height: 12),
            HouseDetail(
              houseModel: widget.houseModel,
            ),
            HouseCategory(
              title: "About the place",
              content: [
                Text(
                  widget.houseModel.about,
                  maxLines: _isExpanded ? null : 3,
                  style: TextStyle(fontSize: 16, height: 1.4),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Text(
                    _isExpanded ? 'Show less' : 'Show more',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            HouseCategory(
              title: "Sleeping arrangements",
              content: [
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: rooms.length,
                    itemBuilder: (context, index) => RoomCard(
                      index: index,
                      listBeds: rooms[index].listBeds,
                    ),
                  ),
                ),
              ],
            ),
            HouseCategory(
              title: "Where is it",
              content: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.all(
                        Radius.circular(10)), // Apply border radius here
                  ),
                  child: Center(
                    child: Text(
                      "Map Placeholder",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            HouseCategory(
              title: "Amenities",
              content: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left column
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.houseModel.getAmenityColumn(0),
                      ),
                    ),
                    // Vertical Divider
                    Container(
                      height: 21 *
                          (widget.houseModel.amenities.length /
                              2), // Adjust height as needed
                      width: 1, // Divider thickness
                      color: Colors.grey,
                      margin: EdgeInsets.only(left: 16, right: 16, top: 6),
                    ),
                    // Right column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.houseModel.getAmenityColumn(1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            HouseCategory(
              title: "House rules",
              content: [
                Text(
                  widget.houseModel.rules,
                  style: TextStyle(fontSize: 16, height: 1.4),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
