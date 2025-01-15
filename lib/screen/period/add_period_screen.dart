import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/model/house_model.dart';
import 'package:figma/widget/form/form_button.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:figma/widget/calendar_table.dart';
import 'package:figma/data/user_data.dart';

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
                  ...users[0].housesList.map(
                        (house) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedHouse = house;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(4),
                            height: 70,
                            width: 60,
                            decoration: BoxDecoration(
                              color: house.image,
                              borderRadius: BorderRadius.circular(12),
                              border: (selectedHouse == house)
                                  ? Border.all(
                                      color: Colors.blue,
                                      width: 2,
                                    )
                                  : null,
                            ),
                          ),
                        ),
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
