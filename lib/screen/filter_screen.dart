import 'package:figma/widget/filter/checkbox.dart';
import 'package:figma/widget/filter/expansion.dart';
import 'package:figma/widget/form/form_button.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:figma/widget/filter/list_tile_counter.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:figma/data/filter_data.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isFlexible = false;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  bool isVillaSelected = false;
  bool isApartmentSelected = false;

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

  final List<bool> statusSelected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final statusFilters=mapFilters.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: HeaderText(
          text:'Filter',
          isLarge: true,
          isBold: true,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, size: 30),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status Filter Chips
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: statusFilters.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FilterChip(
                        selected: statusSelected[index],
                        label: Text(statusFilters[index]),
                        onSelected: (bool selected) {
                          setState(() {
                            statusSelected[index] = selected;
                          });
                        },
                        selectedColor: Colors.blue.shade100,
                      ),
                    );
                  },
                ),
              ),

              // Location Section
              const SizedBox(height: 24),
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
              const SizedBox(height: 16),
              Expansion(
                text: 'Dates',
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2021, 1, 1),
                    lastDay: DateTime.utc(2025, 12, 31),
                    focusedDay: focusedDay,
                    selectedDayPredicate: (day) => isSameDay(selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        this.selectedDay = selectedDay;
                        this.focusedDay = focusedDay;
                      });
                    },
                  ),
                  // Flexible Toggle
                  CheckBox(text: 'Flexible', isBold: true),
                ],
              ),

              // Guests Section
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              Expansion(
                text: 'Type',
                children: [
                  ...typeAccommodation.map((text) => CheckBox(text: text))
                ],
              ),
              // Rooms Section
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
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
                        const SizedBox(width: 16),
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
              const SizedBox(height: 16),
              Expansion(
                text: 'Amenities',
                children: [...amenityName.values.map((text) => CheckBox(text: text))],
              ),
              // Car Section
              const SizedBox(height: 16),
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
              FormButton(text: "Apply Filters", onTap: () {}),
              SizedBox(height: 8),
              FormButton(
                text: "Reset Filters",
                onTap: () {},
                isMain: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
