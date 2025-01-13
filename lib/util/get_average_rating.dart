import 'package:figma/model/review_model.dart';

Map<Property, double> getMapRating(List<ReviewModel> reviews) {
  final result = {
    Property.cleanliness: 0.0,
    Property.communication: 0.0,
    Property.nearPlace: 0.0,
    Property.neighbors: 0.0,
    Property.amenities: 0.0,
  };
  for (var review in reviews) {
    for (var prop in review.mapProperty.keys) {
      result[prop] = (result[prop] ?? 0) + (review.mapProperty[prop] ?? 0);
    }
  }
  if (reviews.isNotEmpty) {
    for (var i in result.keys) {
      result[i] = result[i]! / reviews.length;
    }
  }
  return result;
}
