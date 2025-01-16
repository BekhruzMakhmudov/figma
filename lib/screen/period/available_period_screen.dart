import 'package:figma/data/user_data.dart';
import 'package:figma/screen/period/add_period_screen.dart';
import 'package:figma/screen/profile/profile_screen.dart';
import 'package:figma/util/get_period_string.dart';
import 'package:figma/widget/alert_cancel.dart';
import 'package:figma/widget/text/icon_text.dart';
import 'package:flutter/material.dart';

class AvailablePeriodScreen extends StatefulWidget {
  const AvailablePeriodScreen({super.key});
  @override
  State<AvailablePeriodScreen> createState() => _AvailablePeriodScreenState();
}

class _AvailablePeriodScreenState extends State<AvailablePeriodScreen> {
  bool isFlexible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available periods'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    IconText(
                      icon: Icons.info_outline,
                      text: 'Use button to change publication status',
                    ),
                    ...users[0].housesList.map(
                      (house) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: house.image,
                                ),
                              ),
                              title: Text(
                                house.fullTitle,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    house.isPublished = !house.isPublished;
                                    ScaffoldMessenger.of(context).clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        content: Row(
                                          children: [
                                            Icon(Icons.check,
                                                color: Colors.green),
                                            SizedBox(width: 4),
                                            Text(
                                              'House ${house.isPublished ? '' : 'un'}published successfully',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: house.isPublished
                                      ? Colors.blue
                                      : Colors.red,
                                ),
                                child: Text(house.isPublished
                                    ? 'Published'
                                    : 'Unpublished'),
                              ),
                              onLongPress: () {},
                            ),
                            ...List.generate(
                              house.availablePeriods.length,
                              (index) => Card(
                                child: Column(
                                  children: [
                                    Text(
                                      getPeriodString(
                                          period: house.availablePeriods[index],
                                          format: 'dd MMM, yyyy'),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    AddPeriodScreen(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Edit",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertCancel(
                                                title:
                                                    'Are you sure you want to delete available period?',
                                                textButton: 'Delete',
                                                onTap: () {
                                                  house.availablePeriods
                                                      .removeAt(index);
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProfileScreen(
                                                              userModel:
                                                                  users[0]),
                                                    ),
                                                    (route) => false,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: isFlexible,
                  onChanged: (value) {
                    setState(() {
                      isFlexible = value!;
                    });
                  },
                ),
                Text('I am flexible'),
                Spacer(),
                FloatingActionButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPeriodScreen(),
                    ),
                  ),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
