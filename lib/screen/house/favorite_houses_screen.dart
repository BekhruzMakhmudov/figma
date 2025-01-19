import 'package:figma/data/house_data.dart';
import 'package:figma/widget/house/house_card.dart';
import 'package:figma/widget/snackbar_floating.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:figma/data/user_data.dart';

class FavoriteHousesScreen extends StatefulWidget {
  const FavoriteHousesScreen({super.key});

  @override
  State<FavoriteHousesScreen> createState() => _FavoriteHousesScreenState();
}

class _FavoriteHousesScreenState extends State<FavoriteHousesScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = houses
        .where((house) => house.isFavorite && house.owner != users[0])
        .toList();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
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
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            snackBarFloating(
                              context: context,
                              text: 'Removed from your favourites',
                              inTop: true,
                            ),
                          );
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
