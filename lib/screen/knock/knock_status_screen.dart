import 'package:figma/data/house_data.dart';
import 'package:figma/data/knock_data.dart';
import 'package:figma/data/review_data.dart';
import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/screen/knock/knock_detail_screen.dart';
import 'package:figma/widget/list_tile_shadow.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:figma/data/user_data.dart';

class KnockStatusScreen extends StatelessWidget {
  const KnockStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapKnock = getMapKnock();
    return NavigationFrame(
      index: 2,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(12),
              child: HeaderText(
                text: 'Knock-Knock status',
                isLarge: true,
                isBold: true,
              ),
            ),
            ...KnockStatus.values.map(
              (status) => ListTileShadow(
                title: status.title,
                count: mapKnock[status]!.length,
                nextScreen: KnockDetailScreen(
                  status: status,
                  knockList: mapKnock[status]!,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: HeaderText(
                text: 'Stats of my house',
                isLarge: true,
                isBold: true,
              ),
            ),
            _buildStatsItem(
                title: 'Knock-knock requests',
                count: mapKnock[KnockStatus.received]!.length),
            const Divider(),
            _buildStatsItem(
                title: 'Accommodation views',
                count: mapKnock[KnockStatus.declined]!.length),
            const Divider(),
            _buildStatsItem(
                title: 'Reviews',
                count: reviews
                    .where((review) => review.author == users[0])
                    .length),
            const Divider(),
            _buildStatsItem(
                title: 'Added to favorites',
                count: houses
                    .where(
                        (house) => house.isFavorite && house.owner != users[0])
                    .length),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsItem({required String title, required int count}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        '$count',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
