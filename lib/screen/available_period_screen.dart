import 'package:figma/screen/add_period_screen.dart';
import 'package:flutter/material.dart';

class AvailablePeriodScreen extends StatefulWidget {
  const AvailablePeriodScreen({super.key});
  @override
  State<AvailablePeriodScreen> createState() => _AvailablePeriodScreenState();
}

class _AvailablePeriodScreenState extends State<AvailablePeriodScreen> {
  bool isFlexible = false;
  List<Map<String, dynamic>> periods = [
    {
      'house': 'Cozy apartments in Berlin, Germany',
      'status': 'Unpublished',
      'dates': '04 Oct, 2021 - 07 Nov, 2021',
    },
    {
      'house': 'Cozy apartments in Frankfurt, Germany',
      'status': 'Published',
      'dates': '04 Oct, 2021 - 07 Nov, 2021',
    },
  ];

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
                    ...periods.map(
                      (period) {
                        return Card(
                          child: ListTile(
                            leading: Container(
                              height: 70,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.green,
                              ),
                            ),
                            title: Text(period['house']),
                            subtitle: Text(period['dates']),
                            trailing: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: period['status'] == 'Published'
                                    ? Colors.blue
                                    : Colors.red,
                              ),
                              child: Text(period['status']),
                            ),
                            onLongPress: () {},
                          ),
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
