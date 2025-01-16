import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/model/house_model.dart';
import 'package:figma/screen/profile/profile_screen.dart';
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
  DateTime? start;
  DateTime? end;
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
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
            CalendarTable(
              today: today,
              start: start,
              end: end,
              onRangeSelected: (newStart, newEnd, _) {
                setState(
                  () {
                    if (start?.isAfter(today) ?? true) {
                      start = newStart;
                    }
                    if (end?.isAfter(today) ?? true) {
                      end = newEnd;
                    }
                  },
                );
              },
            ),
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
                  selectedHouse!.availablePeriods.add(
                    DateTimeRange(start: start!, end: end!),
                  );
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('New available period successfully added'),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                  userModel: users[0],
                                ),
                              ),
                                  (route) => false,
                            );
                          },
                          child: Text(
                            'Got it',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  );
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
