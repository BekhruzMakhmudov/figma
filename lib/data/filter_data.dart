import 'package:flutter/material.dart';

enum StatusFilters {
  knockedYou('Knocked you'),
  iKnocked('I Knocked'),
  negotiation('Negotiation'),
  deal('Deal');

  const StatusFilters(this.text);
  final String text;
}

enum TypeAccommodation {
  villa('Villa'),
  apartment('Apartment'),
  mansion('Mansion'),
  manor('Manor'),
  house('House'),
  detached('Detached House');

  const TypeAccommodation(this.text);
  final String text;
}

enum AmenityFilters {
  wifi(Icons.wifi, 'Wi-Fi'),
  hifi(Icons.surround_sound, 'Hi-Fi Sound'),
  workingSpace(Icons.work, 'Working space'),
  fireplace(Icons.fireplace, 'Fireplace'),
  dishwasher(Icons.kitchen, 'Dishwasher'),
  petFriendly(Icons.pets, 'Pet Friendly'),
  equippedKids(Icons.child_friendly, 'Equipped for kids'),
  swimmingPool(Icons.pool, 'Swimming pool'),
  garden(Icons.grass, 'Garden'),
  playstation(Icons.gamepad, 'Playstation'),
  cleaningIncluded(Icons.cleaning_services, 'Cleaning included'),
  motorcycle(Icons.motorcycle, 'Motorcycle'),
  bicycle(Icons.pedal_bike, 'Bicycle'),
  satellite(Icons.satellite_alt, 'Satellite'),
  homeCinema(Icons.movie, 'Home cinema'),
  library(Icons.local_library, 'Library'),
  lounge(Icons.weekend, 'Lounge'),
  dryer(Icons.dry_cleaning, 'Dryer'),
  terrace(Icons.terrain, 'Terrace'),
  gym(Icons.fitness_center, 'Gym'),
  balcony(Icons.balcony, 'Balcony'),
  cableTV(Icons.cable, 'Cable TV'),
  netflix(Icons.movie, 'Netflix'),
  boat(Icons.directions_boat, 'Boat'),
  wii(Icons.gamepad, 'Wii'),
  car(Icons.directions_car, 'Car');

  const AmenityFilters(this.icon, this.text);
  final IconData icon;
  final String text;
}
