import 'package:figma/model/user_model.dart';

enum Parameter {
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
  final String date;
  final double cleanliness;
  final double communication;
  final double nearPlace;
  final double neighbors;
  final double amenities;

  ReviewModel({
    required this.title,
    required this.content,
    required this.author,
    required this.date,
    required this.cleanliness,
    required this.communication,
    required this.nearPlace,
    required this.neighbors,
    required this.amenities,
  });

  double get rating {
    return (cleanliness + communication + nearPlace + neighbors + amenities) /
        5;
  }
}
