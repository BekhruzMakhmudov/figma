import 'data_for_house.dart';
import 'package:figma/model/address_model.dart';
import 'package:figma/model/house_model.dart';
import 'package:flutter/material.dart';

enum HouseDetail {
  guest(Icons.person, 'guest'),
  bedroom(Icons.bed, 'bedroom'),
  bed(Icons.bed, 'bed'),
  bathroom(Icons.bathroom, 'bathroom'),
  carPlace(Icons.local_parking, 'car place'),
  carCharger(Icons.charging_station, 'car charger');

  const HouseDetail(this.icon, this.text);
  final IconData icon;
  final String text;
}

List<HouseModel> houses = [
  HouseModel(
    isVerified: true,
    type: TypeAccommodation.apartment,
    size: 345,
    address: AddressModel(
      district: 'Schoneberg',
      city: 'Berlin',
      country: 'Germany',
    ),
    title: 'Cozy apartments',
    ownerId: 1,
    detail: {
      HouseDetail.guest: 4,
      HouseDetail.bathroom: 1,
    },
    availablePeriods: [
      DateTimeRange(
        start: DateTime(2021, 10, 15),
        end: DateTime(2021, 10, 17),
      ),
      DateTimeRange(
        start: DateTime(2021, 10, 15),
        end: DateTime(2021, 10, 17),
      ),
      DateTimeRange(
        start: DateTime(2021, 10, 15),
        end: DateTime(2021, 10, 17),
      ),
      DateTimeRange(
        start: DateTime(2021, 10, 15),
        end: DateTime(2021, 10, 17),
      ),
    ],
    rooms: rooms,
    amenities: [
      AmenityFilters.wifi,
      AmenityFilters.hifi,
      AmenityFilters.workingSpace,
      AmenityFilters.library,
      AmenityFilters.homeCinema,
      AmenityFilters.dishwasher,
    ],
    about:
        "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation. The room faces the peaceful first patio and is outfitted with a twofold bed.",
    rules:
        "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation.",
    reviews: reviews,
    status: StatusFilters.iKnocked,
    image: Colors.grey,
  ),
  HouseModel(
    isVerified: true,
    type: TypeAccommodation.apartment,
    size: 345,
    address: AddressModel(
      district: 'Schoneberg',
      city: 'Berlin',
      country: 'Germany',
    ),
    title: 'Cozy apartments',
    ownerId: 0,
    detail: {
      HouseDetail.guest: 4,
      HouseDetail.bathroom: 1,
    },
    availablePeriods: [],
    rooms: rooms,
    amenities: [
      AmenityFilters.wifi,
      AmenityFilters.hifi,
      AmenityFilters.workingSpace,
      AmenityFilters.library,
      AmenityFilters.homeCinema,
      AmenityFilters.dishwasher,
    ],
    about:
        "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation. The room faces the peaceful first patio and is outfitted with a twofold bed.",
    rules:
        "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation.",
    reviews: reviews,
    image: Colors.green,
  ),
  HouseModel(
    isVerified: false,
    type: TypeAccommodation.apartment,
    size: 345,
    address: AddressModel(
      district: 'Schoneberg',
      city: 'Berlin',
      country: 'Germany',
    ),
    title: 'Cozy apartments',
    ownerId: 0,
    detail: {
      HouseDetail.guest: 4,
      HouseDetail.bathroom: 1,
    },
    availablePeriods: [
      DateTimeRange(
        start: DateTime(2021, 10, 15),
        end: DateTime(2021, 10, 17),
      ),
      DateTimeRange(
        start: DateTime(2021, 10, 15),
        end: DateTime(2021, 10, 17),
      ),
    ],
    rooms: rooms,
    amenities: [
      AmenityFilters.wifi,
      AmenityFilters.hifi,
      AmenityFilters.workingSpace,
      AmenityFilters.library,
      AmenityFilters.homeCinema,
      AmenityFilters.dishwasher,
    ],
    about:
        "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation. The room faces the peaceful first patio and is outfitted with a twofold bed.",
    rules:
        "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation.",
    reviews: reviews,
    image: Colors.purple,
  ),
  HouseModel(
    isVerified: false,
    type: TypeAccommodation.apartment,
    size: 345,
    address: AddressModel(
      district: 'Schoneberg',
      city: 'Berlin',
      country: 'Germany',
    ),
    title: 'Cozy apartments',
    ownerId: 1,
    detail: {
      HouseDetail.guest: 4,
      HouseDetail.bathroom: 1,
    },
    rooms: rooms,
    amenities: [
      AmenityFilters.wifi,
      AmenityFilters.hifi,
      AmenityFilters.workingSpace,
      AmenityFilters.library,
      AmenityFilters.homeCinema,
      AmenityFilters.dishwasher,
    ],
    about:
        "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation. The room faces the peaceful first patio and is outfitted with a twofold bed.",
    rules:
        "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation.",
    reviews: reviews,
    image: Colors.brown,
  ),
];
