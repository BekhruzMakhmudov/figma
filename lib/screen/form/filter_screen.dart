import 'package:figma/screen/house/houses_list_screen.dart';
import 'package:figma/widget/chip_status.dart';
import 'package:figma/widget/calendar_table.dart';
import 'package:figma/widget/form/form_button.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:figma/data/filter_data.dart';
import 'package:figma/widget/filter/filter_widgets.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isFlexible = false;
  DateTime focusedDay = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;

  final TextEditingController fromSizeController =
      TextEditingController(text: '0');
  final TextEditingController toSizeController =
      TextEditingController(text: '345');

  int adults = 2;
  int bedrooms = 2;
  int beds = 0;
  int bathrooms = 0;
  int carPlace = 0;
  int charger = 0;

  final statusSelected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final statusList = StatusFilters.values;
    final today = DateTime.now();
    DateTime? start;
    DateTime? end;
    return Scaffold(
      appBar: AppBar(
        title: HeaderText(
          text: 'Filter',
          isLarge: true,
          isBold: true,
        ),
        centerTitle: false,
        actions: [
          CloseButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HousesScreen(),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Filter Chips
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: statusList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChipStatus(
                        status: statusList[index],
                        selected: statusSelected[index],
                        onSelected: (bool selected) {
                          setState(() {
                            statusSelected[index] = selected;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Divider(),
            // Location Section
            Expansion(
              text: 'Where?',
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Berlin',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Calendar Section
            Expansion(
              text: 'Dates',
              children: [
                CalendarTable(
                  today: today,
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
                // Flexible Toggle
                CheckBox(text: 'Flexible', isBold: true),
              ],
            ),

            // Guests Section
            Expansion(
              text: 'Guests',
              children: [
                ListTileCounter(
                  title: 'Adults',
                  subtitle: 'Older than 13 y.o',
                  value: adults,
                  onChanged: (value) => setState(
                    () {
                      adults = value;
                    },
                  ),
                ),
              ],
            ),
            // Property Type Section
            Expansion(
              text: 'Type',
              children: [
                ...TypeAccommodation.values
                    .map((type) => CheckBox(text: type.text))
              ],
            ),
            // Rooms Section
            Expansion(
              text: 'Rooms & arrangements',
              children: [
                ListTileCounter(
                  title: 'Bedrooms',
                  value: bedrooms,
                  onChanged: (value) => setState(
                    () {
                      bedrooms = value;
                    },
                  ),
                ),
                ListTileCounter(
                  title: 'Beds',
                  value: beds,
                  onChanged: (value) => setState(
                    () {
                      beds = value;
                    },
                  ),
                ),
                ListTileCounter(
                  title: 'Bathrooms',
                  value: bathrooms,
                  onChanged: (value) => setState(
                    () {
                      bathrooms = value;
                    },
                  ),
                ),
              ],
            ),
            //Size of place Section
            Expansion(
              text: 'Size of place',
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: fromSizeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'From',
                            suffixText: 'm²',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: toSizeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'To',
                            suffixText: 'm²',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Amenities Section
            Expansion(
              text: 'Amenities',
              children: [
                ...AmenityFilters.values.map(
                  (amenity) => CheckBox(text: amenity.text),
                ),
              ],
            ),
            // Car Section
            Expansion(
              text: 'Place for a car',
              children: [
                ListTileCounter(
                  title: 'Car place',
                  value: carPlace,
                  onChanged: (value) => setState(
                    () {
                      carPlace = value;
                    },
                  ),
                ),
                ListTileCounter(
                  title: 'Charger for electric car',
                  value: charger,
                  onChanged: (value) => setState(
                    () {
                      charger = value;
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 8,
              ),
              child: FormButton(
                text: "Apply Filters",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HousesScreen(),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 16,
              ),
              child: FormButton(
                text: "Reset Filters",
                onTap: () {},
                colorText: Colors.black,
                background: Colors.white60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
