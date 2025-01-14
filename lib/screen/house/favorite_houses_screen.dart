import 'package:figma/data/house_data.dart';
import 'package:figma/widget/house/house_card.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';

class FavoriteHousesScreen extends StatefulWidget {
  const FavoriteHousesScreen({super.key});

  @override
  State<FavoriteHousesScreen> createState() => _FavoriteHousesScreenState();
}

class _FavoriteHousesScreenState extends State<FavoriteHousesScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = houses.where((house) => house.isFavorite).toList();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Back'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(
              text: "Favorites",
              isLarge: true,
              isBold: true,
            ),
            const SizedBox(height: 16),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search city...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Listings
            Expanded(
              child: (favorites.isEmpty)
                  ? Center(child: Text("No result found"))
                  : ListView.builder(
                      itemCount: favorites.length,
                      itemBuilder: (context, index) => HouseCard(
                        houseModel: favorites[index],
                        onTap: () {
                          setState(() {
                            favorites[index].isFavorite =
                                !favorites[index].isFavorite;
                          });
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
