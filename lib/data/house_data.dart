import 'package:figma/data/review_data.dart';
import 'package:figma/model/house_model.dart';
final myHouses = [
  HouseModel(
    isVerified: true,
    rating: 3.9,
    address: 'Schoneberg, Berlin',
    title: 'Cozy apartments in Berlin, Germany',
    guests: 4,
    bedrooms: 2,
    beds: 2,
    bathrooms: 1,
    imageUrl: 'assets/house_image.jpg',
    about: "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation. The room faces the peaceful first patio and is outfitted with a twofold bed.",
    rules: "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation.",
    reviews: reviews,
  ),
  HouseModel(
    isVerified: false,
    address: 'Schoneberg, Berlin',
    title: 'Cozy apartments in Berlin, Germany',
    guests: 4,
    bedrooms: 2,
    beds: 2,
    bathrooms: 1,
    imageUrl: 'assets/house_image.jpg',
    about: "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation. The room faces the peaceful first patio and is outfitted with a twofold bed.",
    rules: "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation.",
    reviews: reviews,
  ),
];