import 'package:figma/data/filter_data.dart';
import 'package:figma/model/address_model.dart';
import 'package:figma/model/review_model.dart';
import 'package:figma/model/room_model.dart';
import 'package:figma/model/user_model.dart';
import 'package:figma/util/get_average_rating.dart';
import 'package:figma/util/get_period_string.dart';
import 'package:flutter/material.dart';
import 'package:figma/data/house_data.dart';
import 'package:figma/data/user_data.dart';
import '../widget/text/icon_text.dart';

class HouseModel {
  static int nextId = 0;
  final int id;
  final String title;
  final AddressModel address;
  final int ownerId;
  final Map<HouseDetail, int> detail;
  final List<RoomModel> rooms;
  final String about;
  final String rules;
  final StatusFilters? status;
  final TypeAccommodation type;
  final int size;
  final Color? image;
  bool? isVerified;
  bool isFavorite;
  bool isPublished;
  List<AmenityFilters> amenities;
  List<ReviewModel> reviews;
  List<DateTimeRange> availablePeriods;
  HouseModel({
    this.isVerified = false,
    this.isFavorite = false,
    this.isPublished = false,
    required this.address,
    required this.title,
    required this.ownerId,
    required this.detail,
    required this.rooms,
    required this.about,
    required this.rules,
    required this.type,
    required this.size,
    this.status,
    this.image,
    this.amenities = const [],
    this.reviews = const [],
    this.availablePeriods = const [],
  }) : id = nextId++;

  String get fullTitle {
    return '$title in ${address.cityCountry}';
  }

  Widget get periodRow {
    final size = availablePeriods.length;
    final result = Row(
      children: [
        Icon(Icons.calendar_today),
        SizedBox(width: 4),
        Text(
          availablePeriods.isEmpty
              ? 'Flexible'
              : getPeriodString(
                  period: availablePeriods.first,
                  format: 'dd MMM',
                ),
        ),
        if (size > 1) SizedBox(width: 4),
        if (size > 1)
          Text(
            '(+${size - 1})',
            style: TextStyle(color: Colors.blue),
          ),
      ],
    );
    return result;
  }

  UserModel get owner {
    final owner = users.where((user) => user.id == ownerId).first;
    return owner;
  }

  Map<Property, double> get mapRating {
    return getMapRating(reviews);
  }

  String get averageRating {
    double result = 0;
    for (var value in mapRating.values) {
      result += value;
    }
    return (result / 5).toStringAsFixed(1);
  }

  List<Widget> get houseDetail {
    List<Widget> result = [];
    detail[HouseDetail.bedroom] = rooms.length;
    detail[HouseDetail.bed] = countBeds;
    final entries = detail.entries.toList();
    for (int i = 0; i < entries.length; i++) {
      int value = detail[entries[i].key]!;
      String text = entries[i].key.text;
      result.add(
        IconText(
          icon: entries[i].key.icon,
          text: "$value $text${(value > 1) ? 's' : ''}",
        ),
      );
      if (i < entries.length - 1) result.add(Text("•"));
    }
    return result;
  }

  int get countBeds {
    int result = 0;
    for (var room in rooms) {
      for (var bed in room.listBeds) {
        result += bed.count;
      }
    }
    return result;
  }

  List<Widget> getAmenityColumn(int start) {
    List<Widget> result = [];
    for (var i = start; i < amenities.length; i += 2) {
      result.add(
        IconText(
          icon: amenities[i].icon,
          text: amenities[i].text,
        ),
      );
    }
    return result;
  }
}
