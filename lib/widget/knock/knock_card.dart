import 'package:figma/data/knock_data.dart';
import 'package:figma/model/knock_model.dart';
import 'package:figma/widget/profile_card.dart';
import 'package:figma/widget/sheet/cancel_knock_sheet.dart';
import 'package:figma/widget/sheet/rate_accommodation_sheet.dart';
import 'package:figma/widget/knock/knock_content.dart';
import 'package:figma/widget/text/icon_text.dart';
import 'package:flutter/material.dart';

class KnockCard extends StatefulWidget {
  final KnockModel knockModel;
  const KnockCard({
    super.key,
    required this.knockModel,
  });

  @override
  State<KnockCard> createState() => _KnockCardState();
}

class _KnockCardState extends State<KnockCard> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    String text = widget.knockModel.status.subtitle;
    final owner = widget.knockModel.house.owner;
    if (widget.knockModel.status == KnockStatus.declined) {
      text += " ${owner.name}";
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  widget.knockModel.date,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            ProfileCard(
              color: widget.knockModel.house.image,
              size: 70,
              title: IconText(
                icon: Icons.calendar_month,
                text: widget.knockModel.period,
                iconColor: Colors.blue,
              ),
              subtitle: Text(
                widget.knockModel.house.fullTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 8),
            ProfileCard(
              color: owner.avatar,
              size: 70,
              isActive: owner.isActive,
              title: Text(
                owner.name,
                style: TextStyle(color: Colors.grey),
              ),
              button: knockStatusUserButton[widget.knockModel.status],
            ),
            if (isExpanded) _buildExpandedContent(),
            Center(
              child: ExpandIcon(
                isExpanded: isExpanded,
                onPressed: (expanded) => setState(
                  () {
                    isExpanded = !expanded;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedContent() {
    return Column(
      children: [
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        KnockContent(knockModel: widget.knockModel),
        SizedBox(height: 8),
        if (widget.knockModel.status.confirm.isNotEmpty)
          ElevatedButton(
            onPressed: () {
              if (widget.knockModel.status == KnockStatus.exchanged) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => RateAccommodationSheet(
                    houseId: widget.knockModel.house.id,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  (widget.knockModel.status != KnockStatus.madeByMe)
                      ? Colors.blue
                      : Colors.blue.withAlpha(70),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              widget.knockModel.status.confirm,
              style: TextStyle(
                color: Colors.blue[20],
              ),
            ),
          ),
        if (widget.knockModel.status.cancel.isNotEmpty)
          Center(
            child: TextButton(
              onPressed: () async {
                showModalBottomSheet<bool>(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => CancelKnockSheet(
                    knockModel: widget.knockModel,
                  ),
                );
              },
              child: Text(
                widget.knockModel.status.cancel,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
      ],
    );
  }
}
