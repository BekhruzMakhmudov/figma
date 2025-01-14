import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/model/house_model.dart';
import 'package:figma/widget/form/form_button.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:figma/widget/form/calendar_table.dart';

class AddPeriodScreen extends StatefulWidget {
  const AddPeriodScreen({super.key});
  @override
  State<AddPeriodScreen> createState() => _AddPeriodScreenState();
}

class _AddPeriodScreenState extends State<AddPeriodScreen> {
  HouseModel? selectedHouse;
  DateTimeRange? selectedRange;
  @override
  Widget build(BuildContext context) {
    return NavigationFrame(
      index: 3,
      appBar: AppBar(
        centerTitle: true,
        title: HeaderText(
          text: "Add period",
          isBold: true,
          isLarge: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CalendarTable(),
            Text(
              "Choose house",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.all(4),
                    height: 70,
                    width: 60,
                    color: Colors.green,
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    height: 70,
                    width: 60,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            FormButton(
                text: "Save",
                onTap: () {
                  Navigator.pop(context, selectedRange);
                }),
            SizedBox(height: 16),
            FormButton(
                text: "Cancel",
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
