import 'package:figma/data/filter_data.dart';
import 'package:figma/data/review_data.dart';
import 'package:figma/data/user_data.dart';
import 'package:figma/model/bed_model.dart';
import 'package:figma/model/house_model.dart';
import 'package:figma/model/room_model.dart';
import 'package:flutter/material.dart';

enum HouseDetail {
  guest,
  bedroom,
  bed,
  bathroom,
  carPlace,
  carCharger,
}

final mapDetailText = {
  HouseDetail.guest: 'guest',
  HouseDetail.bedroom: 'bedroom',
  HouseDetail.bed: 'bed',
  HouseDetail.bathroom: 'bathroom',
  HouseDetail.carPlace: 'car place',
  HouseDetail.carCharger: 'car charger',
};

final mapDetailIcon = {
  HouseDetail.guest: Icons.person,
  HouseDetail.bedroom: Icons.bed,
  HouseDetail.bed: Icons.bed,
  HouseDetail.bathroom: Icons.bathroom,
  HouseDetail.carPlace: Icons.local_parking,
  HouseDetail.carCharger: Icons.charging_station
};

List<HouseModel> houses = [
  HouseModel(
    isVerified: true,
    district: 'Schoneberg',
    city: 'Berlin',
    country: 'Germany',
    title: 'Cozy apartments',
    owner: users[1],
    detail: {
      HouseDetail.guest: 4,
      HouseDetail.bathroom: 1,
    },
    rooms: [
      RoomModel(
        [
          BedModel(size: "double size bed", count: 1),
          BedModel(size: "sofa", count: 1),
        ],
      ),
      RoomModel(
        [
          BedModel(size: "single size bed", count: 2),
          BedModel(size: "sofa", count: 1),
        ],
      ),
      RoomModel(
        [
          BedModel(size: "single size bed", count: 2),
          BedModel(size: "sofa", count: 1),
        ],
      ),
    ],
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
    image: Colors.amber,
  ),
  HouseModel(
    isVerified: true,
    district: 'Schoneberg',
    city: 'Berlin',
    country: 'Germany',
    title: 'Cozy apartments',
    owner: users[0],
    detail: {
      HouseDetail.guest: 4,
      HouseDetail.bathroom: 1,
    },
    rooms: [
      RoomModel(
        [
          BedModel(size: "double size bed", count: 1),
          BedModel(size: "sofa", count: 1),
        ],
      ),
      RoomModel(
        [
          BedModel(size: "single size bed", count: 2),
          BedModel(size: "sofa", count: 1),
        ],
      ),
      RoomModel(
        [
          BedModel(size: "single size bed", count: 2),
          BedModel(size: "sofa", count: 1),
        ],
      ),
    ],
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
    district: 'Schoneberg',
    city: 'Berlin',
    country: 'Germany',
    title: 'Cozy apartments',
    owner: users[0],
    detail: {
      HouseDetail.guest: 4,
      HouseDetail.bathroom: 1,
    },
    rooms: [
      RoomModel(
        [
          BedModel(size: "double size bed", count: 1),
          BedModel(size: "sofa", count: 1),
        ],
      ),
      RoomModel(
        [
          BedModel(size: "single size bed", count: 2),
          BedModel(size: "sofa", count: 1),
        ],
      ),
      RoomModel(
        [
          BedModel(size: "single size bed", count: 2),
          BedModel(size: "sofa", count: 1),
        ],
      ),
    ],
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
    image: Colors.red,
  ),
];
