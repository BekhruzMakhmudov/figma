import 'package:figma/data/user_data.dart';
import 'package:figma/model/review_model.dart';
final reviews = [
  ReviewModel(
    title: "Exellent apartments with cozy and calm area!",
    content:
        "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation. The room faces the peaceful first patio and is outfitted with a twofold bed, a closet and a work area. The windows of the living and lounge area of j.",
    mapProperty: {
      Property.cleanliness: 4,
      Property.communication: 5,
      Property.nearPlace: 4,
      Property.neighbours: 5,
      Property.amenities: 5,
    },
    author: users[1],
    houseId: 0,
    date: "12.09.2020",
  ),
  ReviewModel(
    title: "Exellent apartments with cozy and calm area!",
    content:
        "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation. The room faces the peaceful first patio and is outfitted with a twofold bed, a closet and a work area. The windows of the living and lounge area of j.",
    mapProperty: {
      Property.cleanliness: 5,
      Property.communication: 5,
      Property.nearPlace: 5,
      Property.neighbours: 5,
      Property.amenities: 5,
    },
    author: users[1],
    houseId: 0,
    date: "12.09.2020",
  ),
];
