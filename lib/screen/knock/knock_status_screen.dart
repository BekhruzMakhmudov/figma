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
    final knockCount = getKnockCount();
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
              ListTileShadow(
                  title: knockStatusTitle[KnockStatus.madeByMe]!,
                  count: knockCount[KnockStatus.madeByMe],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KnockDetailScreen(
                          status: KnockStatus.madeByMe,
                          count: knockCount[KnockStatus.madeByMe]!,
                        ),
                      ),
                    );
                  }),
              ListTileShadow(
                  title: "Knocks received",
                  count: knockCount[KnockStatus.received],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KnockDetailScreen(
                          status: KnockStatus.received,
                          count: knockCount[KnockStatus.received]!,
                        ),
                      ),
                    );
                  }),
              ListTileShadow(
                  title: "Declined",
                  count: knockCount[KnockStatus.declined],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KnockDetailScreen(
                          status: KnockStatus.declined,
                          count: knockCount[KnockStatus.declined]!,
                        ),
                      ),
                    );
                  }),
              ListTileShadow(
                  title: "Negotiation",
                  count: knockCount[KnockStatus.negotiation],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KnockDetailScreen(
                          status: KnockStatus.negotiation,
                          count: knockCount[KnockStatus.negotiation]!,
                        ),
                      ),
                    );
                  }),
              ListTileShadow(
                  title: "Upcoming Exchanges",
                  count: knockCount[KnockStatus.upcoming],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KnockDetailScreen(
                          status: KnockStatus.upcoming,
                          count: knockCount[KnockStatus.upcoming]!,
                        ),
                      ),
                    );
                  }),
              ListTileShadow(
                  title: "Exchanged",
                  count: knockCount[KnockStatus.exchanged],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => KnockDetailScreen(
                          status: KnockStatus.exchanged,
                          count: knockCount[KnockStatus.exchanged]!,
                        ),
                      ),
                    );
                  }),
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
                  count: knockCount[KnockStatus.received]!),
              const Divider(),
              _buildStatsItem(
                  title: 'Accommodation views',
                  count: knockCount[KnockStatus.declined]!),
              const Divider(),
              _buildStatsItem(
                  title: 'Reviews',
                  count: reviews
                      .where((review) => review.author == users[0])
                      .length),
              const Divider(),
              _buildStatsItem(
                  title: 'Added to favorites',
                  count: houses.where((house) => house.isFavorite).length),
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
