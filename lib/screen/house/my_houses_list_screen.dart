import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/widget/house/house_card.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:figma/data/user_data.dart';

class MyHousesScreen extends StatelessWidget {
  const MyHousesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final houses = users[0].housesList;
    return NavigationFrame(
      index: 3,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: HeaderText(text: 'My houses'),
      ),
      body: (houses.isEmpty)
          ? const EmptyStateWidget()
          : SingleChildScrollView(
              child: Column(
                children: [
                  ...houses.map(
                    (house) => HouseCard(houseModel: house, onTap: () {}),
                  ),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Text(
              'You have not uploaded\nyour accommodation yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'You can exchange and Knock only when your\naccommodation is uploaded.',
              textAlign: TextAlign.center,
            ),
            const Text(
              'To upload your house use our website',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.surface,
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Go to website'),
          ),
        ),
      ],
    );
  }
}
