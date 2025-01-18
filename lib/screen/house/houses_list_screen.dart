import 'package:figma/data/house_data.dart';
import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/screen/form/filter_screen.dart';
import 'package:figma/widget/house/house_card.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';

class HousesScreen extends StatefulWidget {
  const HousesScreen({super.key});

  @override
  State<HousesScreen> createState() => _HousesScreenState();
}

class _HousesScreenState extends State<HousesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NavigationFrame(
        index: 0,
        appBar: AppBar(
          title: HeaderText(text: 'Houses'),
          actions: [
            IconButton(
              icon: const Icon(Icons.tune),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterScreen(),
                  ),
                );
              },
            ),
          ],
          bottom: TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: const [
              Tab(text: 'Discover'),
              Tab(text: 'Recently Added'),
              Tab(text: 'Nearby'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            (houses.isEmpty)
                ? Center(child: Text('No results found'))
                : ListView.builder(
                    itemCount: houses.length,
                    itemBuilder: (context, index) {
                      return HouseCard(
                        houseModel: houses[index],
                        onTap: () {
                          setState(() {
                            houses[index].isFavorite =
                                !houses[index].isFavorite;
                          });
                        },
                      );
                    },
                  ),
            Center(child: Text('No results found')),
            Center(child: Text('No results found')),
          ],
        ),
      ),
    );
  }
}
