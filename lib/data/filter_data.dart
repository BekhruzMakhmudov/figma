import 'package:flutter/material.dart';

enum StatusFilters {
  knockedYou,
  iKnocked,
  negotiation,
  deal,
}

final Map<StatusFilters, String> mapFilters = {
  StatusFilters.knockedYou: 'Knocked you',
  StatusFilters.iKnocked: 'I Knocked',
  StatusFilters.negotiation: 'Negotiation',
  StatusFilters.deal: 'Deal'
};

final List<String> typeAccommodation = [
  'Villa',
  'Apartment',
  'Mansion',
  'Manor',
  'House',
  'Detached House',
];

enum AmenityFilters{
  wifi,
  hifi,
  workingSpace,
  fireplace,
  dishwasher,
  petFriendly,
  equippedKids,
  swimmingPool,
  garden,
  playstation,
  cleaningIncluded,
  motorcycle,
  bicycle,
  satellite,
  homeCinema,
  library,
  lounge,
  dryer,
  terrace,
  gym,
  balcony,
  cableTV,
  netflix,
  boat,
  wii,
  car,
}

final Map<AmenityFilters,IconData> amenityIcon={
  AmenityFilters.wifi:Icons.wifi,
  AmenityFilters.hifi:Icons.surround_sound,
  AmenityFilters.workingSpace:Icons.work,
  AmenityFilters.fireplace:Icons.fireplace,
  AmenityFilters.dishwasher:Icons.kitchen,
  AmenityFilters.petFriendly:Icons.pets,
  AmenityFilters.equippedKids:Icons.child_friendly,
  AmenityFilters.swimmingPool:Icons.pool,
  AmenityFilters.garden:Icons.grass,
  AmenityFilters.playstation:Icons.gamepad,
  AmenityFilters.cleaningIncluded:Icons.cleaning_services,
  AmenityFilters.motorcycle:Icons.motorcycle,
  AmenityFilters.bicycle:Icons.pedal_bike,
  AmenityFilters.satellite:Icons.satellite_alt,
  AmenityFilters.homeCinema:Icons.movie,
  AmenityFilters.library:Icons.local_library,
  AmenityFilters.lounge:Icons.weekend,
  AmenityFilters.dryer:Icons.dry_cleaning,
  AmenityFilters.terrace:Icons.terrain,
  AmenityFilters.gym:Icons.fitness_center,
  AmenityFilters.balcony:Icons.balcony,
  AmenityFilters.cableTV:Icons.cable,
  AmenityFilters.netflix:Icons.movie,
  AmenityFilters.boat:Icons.directions_boat,
  AmenityFilters.wii:Icons.gamepad,
  AmenityFilters.car:Icons.directions_car,
};

final Map<AmenityFilters,String> amenityName= {
  AmenityFilters.wifi:'Wi-Fi',
  AmenityFilters.hifi:'Hi-Fi Sound',
  AmenityFilters.workingSpace:'Working space',
  AmenityFilters.fireplace:'Fireplace',
  AmenityFilters.dishwasher:'Dishwasher',
  AmenityFilters.petFriendly:'Pet Friendly',
  AmenityFilters.equippedKids:'Equipped for kids',
  AmenityFilters.swimmingPool:'Swimming pool',
  AmenityFilters.garden:'Garden',
  AmenityFilters.playstation:'Playstation',
  AmenityFilters.cleaningIncluded:'Cleaning included',
  AmenityFilters.motorcycle:'Motorcycle',
  AmenityFilters.bicycle:'Bicycle',
  AmenityFilters.satellite:'Satellite',
  AmenityFilters.homeCinema:'Home cinema',
  AmenityFilters.library:'Library',
  AmenityFilters.lounge:'Lounge',
  AmenityFilters.dryer:'Dryer',
  AmenityFilters.terrace:'Terrace',
  AmenityFilters.gym:'Gym',
  AmenityFilters.balcony:'Balcony',
  AmenityFilters.cableTV:'Cable TV',
  AmenityFilters.netflix:'Netflix',
  AmenityFilters.boat:'Boat',
  AmenityFilters.wii:'Wii',
  AmenityFilters.car:'Car',
};
