import 'package:figma/data/knock_data.dart';
import 'package:figma/widget/knock_card.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';

class KnockDetailScreen extends StatelessWidget {
  final KnockStatus status;
  final int count;
  const KnockDetailScreen({
    super.key,
    required this.status,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final filtredKnocked=knocks.where((knock)=>knock.status==status);
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: HeaderText(
                text: knockStatusTitle[status]!,
                isLarge: true,
                isBold: true,
              ),
              trailing: HeaderText(
                text: '($count)',
                isLarge: false,
                isBold: true,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ...filtredKnocked.map((knock)=>KnockCard(knockModel: knock))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
