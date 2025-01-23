import 'package:figma/data/knock_data.dart';
import 'package:figma/model/knock_model.dart';
import 'package:figma/widget/knock/knock_card.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';

class KnockDetailScreen extends StatefulWidget {
  final KnockStatus status;
  final List<KnockModel> knockList;
  const KnockDetailScreen({
    super.key,
    required this.status,
    required this.knockList,
  });

  @override
  State<KnockDetailScreen> createState() => _KnockDetailScreenState();
}

class _KnockDetailScreenState extends State<KnockDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
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
                text: widget.status.title,
                isLarge: true,
                isBold: true,
              ),
              trailing: HeaderText(
                text: '(${widget.knockList.length})',
                isLarge: false,
                isBold: true,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.knockList.length,
                itemBuilder: (context, index) => KnockCard(
                  knockModel: widget.knockList[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
