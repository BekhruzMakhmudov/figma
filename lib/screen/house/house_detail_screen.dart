import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/model/house_model.dart';
import 'package:figma/widget/house/house_detail.dart';
import 'package:figma/widget/house/room_card.dart';
import 'package:flutter/material.dart';

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
            Divider(),
            // About Place
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About the place",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
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
            ),
            Divider(),
            // Sleeping Arrangements
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sleeping arrangements",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
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
            ),
            Divider(),
            // Map Section
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Where is it",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
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
            ),
            Divider(),
            // Amenities
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amenities",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
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
            ),
            Divider(),
            // House Rules
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "House rules",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    widget.houseModel.rules,
                    style: TextStyle(fontSize: 16, height: 1.4),
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
