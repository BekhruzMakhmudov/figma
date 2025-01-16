import 'package:figma/model/user_model.dart';

enum Property {
  cleanliness,
  communication,
  nearPlace,
  neighbours,
  amenities,
}

final mapProperty={
  Property.cleanliness:'Cleanliness',
  Property.communication:'Communication with member',
  Property.nearPlace:'Area near place',
  Property.neighbours:'Neighbours',
  Property.amenities:'Amenities',
};

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
    double result=0;
    for(var property in Property.values){
      result+=mapProperty[property]!;
    }
    return result/Property.values.length;
  }
}
