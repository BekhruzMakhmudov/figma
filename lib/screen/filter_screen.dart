import 'package:figma/widget/checkbox.dart';
import 'package:figma/widget/form_button.dart';
import 'package:figma/widget/range_number.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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

  final List<String> statusFilters = [
    'Knocked you',
    'I Knocked',
    'Negotiation',
    'Deal'
  ];
  final List<bool> statusSelected = [false, false, false, false];

  final List<String> typeAccommodation = [
    'Villa',
    'Apartment',
    'Mansion',
    'Manor',
    'House',
    'Detached House',
  ];
  final List<String> typeAmenity = [
    'Wi-Fi',
    'Hi-Fi Sound',
    'Working space',
    'Fireplce',
    'Dishwasher',
    'Pet Friendly',
    'Equipped for kids',
    'Swimming pool',
    'Garden',
    'Playstation',
    'Cleaning included',
    'Motocycle',
    'Bicycle',
    'Satelite',
    'Home cinema',
    'Library',
    'Lounge',
    'Dryer',
    'Terrace',
    'Gym',
    'Balcony',
    'Cable TV',
    'Netflix',
    'Boat',
    'Wii',
    'Car',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontWeight: FontWeight.bold),
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
              ExpansionTile(
                title: Text(
                  'Where?',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
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
              ExpansionTile(
                title: Text(
                  'Dates',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
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
              ExpansionTile(
                title: Text(
                  'Guests',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Adults',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text('Older than 13 y.o'),
                    trailing: RangeNumber(),
                  ),
                ],
              ),
              // Property Type Section
              const SizedBox(height: 16),
              ExpansionTile(
                title: Text(
                  'Type',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                children: [
                  ...typeAccommodation.map((text) => CheckBox(text: text))
                ],
              ),
              // Rooms Section
              const SizedBox(height: 16),
              ExpansionTile(
                title: Text(
                  'Rooms & arrangements',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: const Text(
                      'Bedrooms',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: RangeNumber(),
                  ),
                  ListTile(
                    title: const Text(
                      'Beds',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: RangeNumber(),
                  ),
                  ListTile(
                    title: const Text(
                      'Bathrooms',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: RangeNumber(),
                  ),
                ],
              ),
              // Amenities Section
              const SizedBox(height: 16),
              ExpansionTile(
                title: Text(
                  'Amenities',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                children: [...typeAmenity.map((text) => CheckBox(text: text))],
              ),
              // Car Section
              const SizedBox(height: 16),
              ExpansionTile(
                title: Text(
                  'Place for a car',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Car place',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: RangeNumber(),
                  ),
                  ListTile(
                    title: Text(
                      'Charger for electric car',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: RangeNumber(),
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
