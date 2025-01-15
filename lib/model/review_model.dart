import 'package:figma/model/user_model.dart';

enum Property {
  cleanliness,
  communication,
  nearPlace,
  neighbors,
  amenities,
}

class ReviewModel {
  final String title;
  final String content;
  final UserModel author;
  final int houseId;
  final String date;
  final Map<Property, double> mapProperty;

  ReviewModel({
    required this.title,
    required this.content,
    required this.author,
    required this.houseId,
    required this.date,
    required this.mapProperty,
  });

  double get rating {
    return (mapProperty[Property.cleanliness]! +
            mapProperty[Property.communication]! +
            mapProperty[Property.nearPlace]! +
            mapProperty[Property.neighbors]! +
            mapProperty[Property.amenities]!) /
        5;
  }
}
