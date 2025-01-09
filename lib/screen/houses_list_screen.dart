import 'package:figma/data/house_data.dart';
import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/screen/filter_screen.dart';
import 'package:figma/widget/house/house_card.dart';
import 'package:flutter/material.dart';

class HousesScreen extends StatelessWidget {
  const HousesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NavigationFrame(
        index: 0,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Houses',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.tune, color: Colors.black),
              onPressed: () {
                Navigator.push(
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
                ? EmptyStateWidget()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: houses.length,
                    itemBuilder: (context, index) {
                      return HouseCard(houseModel: houses[index]);
                    },
                  ),
            EmptyStateWidget(),
            EmptyStateWidget(),
          ],
        ),
      ),
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No results found'));
  }
}
