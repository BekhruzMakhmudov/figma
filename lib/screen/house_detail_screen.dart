import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/model/house_model.dart';
import 'package:figma/widget/house/house_detail.dart';
import 'package:figma/widget/house/room_card.dart';
import 'package:figma/widget/text/icon_text.dart';
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
                      text: widget.houseModel.title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    WidgetSpan(child: SizedBox(width: 8)),
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
                widget.houseModel.address,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 12),
              HouseDetail(
                guests: widget.houseModel.guests,
                bathrooms: widget.houseModel.bathrooms,
                bedrooms: widget.houseModel.bedrooms,
                beds: widget.houseModel.beds,
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
                      widget.houseModel.about ?? "",
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          RoomCard(
                            icon: Icons.king_bed,
                            mainText: "Bedroom 1",
                            description: ["1 king size bed", "1 sofa"],
                          ),
                          RoomCard(
                            icon: Icons.king_bed,
                            mainText: "Bedroom 2",
                            description: ["1 queen size bed", "1 sofa"],
                          ),
                          RoomCard(
                            icon: Icons.king_bed,
                            mainText: "Bedroom 3",
                            description: ["2 twin beds", "1 sofa"],
                          ),
                        ],
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                            children: [
                              IconText(icon: Icons.wifi, text: "Wi-Fi"),
                              SizedBox(height: 8),
                              IconText(icon: Icons.work, text: "Working space"),
                              SizedBox(height: 8),
                              IconText(icon: Icons.tv, text: "Home cinema"),
                            ],
                          ),
                        ),
                        // Vertical Divider
                        Container(
                          height: 75, // Adjust height as needed
                          width: 1, // Divider thickness
                          color: Colors.grey,
                          margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                        ),
                        // Right column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconText(
                                icon: Icons.surround_sound,
                                text: "Hi-Fi Sound",
                              ),
                              SizedBox(height: 8),
                              IconText(
                                icon: Icons.local_library,
                                text: "Library",
                              ),
                              SizedBox(height: 8),
                              IconText(
                                icon: Icons.kitchen,
                                text: "Dishwasher",
                              ),
                            ],
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 12),
                    Text(
                      widget.houseModel.rules ?? "",
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
