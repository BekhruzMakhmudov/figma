import 'package:figma/data/knock_data.dart';
import 'package:figma/model/knock_model.dart';
import 'package:figma/widget/knock/knock_content.dart';
import 'package:figma/widget/text/icon_text.dart';
import 'package:flutter/material.dart';

class KnockCard extends StatelessWidget {
  final KnockModel knockModel;
  const KnockCard({super.key, required this.knockModel});
  @override
  Widget build(BuildContext context) {
    String text = knockStatusSubtitle[knockModel.status]!;
    String name = knockModel.house.owner.name;
    if (knockModel.status == KnockStatus.declined) text += " $name";
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
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
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconText(
                      icon: Icons.calendar_month,
                      text: knockModel.period,
                      iconColor: Colors.blue,
                    ),
                    Text(
                      knockModel.house.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: knockModel.house.owner.avatar,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      name,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                knockStatusUserButton[knockModel.status] ?? Container(),
              ],
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 8),
            KnockContent(knockModel: knockModel),
            SizedBox(height: 8),
            if (knockStatusConfirm[knockModel.status] != null)
              ElevatedButton(
                onPressed: () {},
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
                  onPressed: () {},
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
