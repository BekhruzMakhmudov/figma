import 'package:figma/data/knock_data.dart';
import 'package:figma/model/knock_model.dart';
import 'package:figma/widget/profile_card.dart';
import 'package:figma/widget/sheet/cancel_knock_sheet.dart';
import 'package:figma/widget/sheet/rate_accommodation_sheet.dart';
import 'package:figma/widget/knock/knock_content.dart';
import 'package:figma/widget/text/icon_text.dart';
import 'package:flutter/material.dart';

class KnockCard extends StatelessWidget {
  final KnockModel knockModel;
  const KnockCard({
    super.key,
    required this.knockModel,
  });
  @override
  Widget build(BuildContext context) {
    String text = knockStatusSubtitle[knockModel.status]!;
    final owner = knockModel.house.owner;
    if (knockModel.status == KnockStatus.declined) text += " ${owner.name}";
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
                  knockModel.date,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            ProfileCard(
              color: knockModel.house.image!,
              size: 50,
              title: IconText(
                icon: Icons.calendar_month,
                text: knockModel.period,
                iconColor: Colors.blue,
              ),
              subtitle: Text(
                knockModel.house.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            ProfileCard(
              color: owner.avatar,
              size: 50,
              isActive: owner.isActive,
              title: Text(
                owner.name,
                style: TextStyle(color: Colors.grey),
              ),
              button: knockStatusUserButton[knockModel.status],
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 8),
            KnockContent(knockModel: knockModel),
            SizedBox(height: 8),
            if (knockStatusConfirm[knockModel.status] != null)
              ElevatedButton(
                onPressed: () {
                  if (knockModel.status == KnockStatus.exchanged) {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => RateAccommodationSheet(
                        houseId: knockModel.house.id,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: (knockModel.status != KnockStatus.madeByMe)
                      ? Colors.blue
                      : Colors.blue.withAlpha(70),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  knockStatusConfirm[knockModel.status]!,
                  style: TextStyle(
                    color: Colors.blue[20],
                  ),
                ),
              ),
            if (knockStatusCancel[knockModel.status] != null)
              Center(
                child: TextButton(
                  onPressed: () async {
                    showModalBottomSheet<bool>(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => CancelKnockSheet(
                        knockModel: knockModel,
                      ),
                    );
                  },
                  child: Text(
                    knockStatusCancel[knockModel.status]!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
