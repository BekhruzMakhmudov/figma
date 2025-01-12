import 'package:figma/data/knock_data.dart';
import 'package:figma/model/knock_model.dart';
import 'package:figma/widget/knock/knock_card.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';

class KnockDetailScreen extends StatefulWidget {
  final KnockStatus status;
  final int count;
  const KnockDetailScreen({
    super.key,
    required this.status,
    required this.count,
  });

  @override
  State<KnockDetailScreen> createState() => _KnockDetailScreenState();
}

class _KnockDetailScreenState extends State<KnockDetailScreen> {
  @override
  Widget build(BuildContext context) {
    List<KnockModel> filtredKnocked =
        knocks.where((knock) => knock.status == widget.status).toList();
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
                text: knockStatusTitle[widget.status]!,
                isLarge: true,
                isBold: true,
              ),
              trailing: HeaderText(
                text: '(${widget.count})',
                isLarge: false,
                isBold: true,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filtredKnocked.length,
                itemBuilder: (context, index) => KnockCard(
                  knockModel: filtredKnocked[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
