import 'package:figma/data/filter_data.dart';
import 'package:figma/model/review_model.dart';
import 'package:figma/model/user_model.dart';
import 'package:figma/util/get_average_rating.dart';
import 'package:flutter/material.dart';
class HouseModel{
  final bool isVerified;
  final String title;
  final String district;
  final String city;
  final String country;
  final UserModel owner;
  final int guests;
  final int bedrooms;
  final int beds;
  final int bathrooms;
  final String about;
  final String rules;
  final StatusFilters? status;
  final Color? image;
  bool isFavorite=false;
  List<AmenityFilters> amenities;
  List<ReviewModel> reviews;
  HouseModel({
    required this.isVerified,
    required this.district,
    required this.city,
    required this.country,
    required this.title,
    required this.owner,
    required this.guests,
    required this.bedrooms,
    required this.beds,
    required this.bathrooms,
    required this.about,
    required this.rules,
    this.status,
    this.image,
    this.amenities=const [],
    this.reviews=const [],
  });
  String get cityCountry{
    return '$city, $country';
  }
  String get fullTitle{
    return '$title in $cityCountry';
  }
  Map<Property,double> get mapRating{
    return getMapRating(reviews);
  }
  String get averageRating{
    double result=0;
    for(var value in mapRating.values){
      result+=value;
    }
    return (result/5).toStringAsFixed(1);
  }
}