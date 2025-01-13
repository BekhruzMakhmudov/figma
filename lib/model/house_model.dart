import 'package:figma/data/filter_data.dart';
import 'package:figma/model/review_model.dart';
import 'package:figma/model/user_model.dart';
import 'package:figma/util/get_average_rating.dart';
class HouseModel{
  final bool isVerified;
  final String address;
  final String? location;
  final String title;
  final UserModel owner;
  final int guests;
  final int bedrooms;
  final int beds;
  final int bathrooms;
  final String? imageUrl;
  final String? about;
  final String? rules;
  final StatusFilters? status;
  bool isFavorite=false;
  List<AmenityFilters> amenities;
  List<ReviewModel> reviews;
  HouseModel({
    required this.isVerified,
    this.location,
    required this.address,
    required this.title,
    required this.owner,
    required this.guests,
    required this.bedrooms,
    required this.beds,
    required this.bathrooms,
    this.imageUrl,
    this.about,
    this.rules,
    this.status,
    this.amenities=const [],
    this.reviews=const [],
  });
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