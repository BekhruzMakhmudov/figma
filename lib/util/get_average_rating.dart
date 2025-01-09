import 'package:figma/model/review_model.dart';
double getAverageRating(List<ReviewModel> reviews){
  double sum=0;
  if(reviews.isEmpty) return 0;
  for (var review in reviews) {
    sum+=review.rating;
  }
  return sum/reviews.length;
}