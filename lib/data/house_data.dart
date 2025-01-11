import 'package:figma/data/filter_data.dart';
import 'package:figma/data/review_data.dart';
import 'package:figma/data/user_data.dart';
import 'package:figma/model/house_model.dart';
List<HouseModel> emptyHouseList = [];
final houses = [
  HouseModel(
    isVerified: true,
    address: 'Schoneberg, Berlin',
    title: 'Cozy apartments in Berlin, Germany',
    owner: users[1],
    guests: 4,
    bedrooms: 2,
    beds: 2,
    bathrooms: 1,
    about: "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation. The room faces the peaceful first patio and is outfitted with a twofold bed.",
    rules: "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation.",
    reviews: reviews,
    status: StatusFilters.iKnocked,
  ),
];
final myHouses = [
  HouseModel(
    isVerified: true,
    address: 'Schoneberg, Berlin',
    title: 'Cozy apartments in Berlin, Germany',
    owner: users[0],
    guests: 4,
    bedrooms: 2,
    beds: 2,
    bathrooms: 1,
    about: "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation. The room faces the peaceful first patio and is outfitted with a twofold bed.",
    rules: "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation.",
    reviews: reviews,
  ),
  HouseModel(
    isVerified: false,
    address: 'Schoneberg, Berlin',
    title: 'Cozy apartments in Berlin, Germany',
    owner: users[0],
    guests: 4,
    bedrooms: 2,
    beds: 2,
    bathrooms: 1,
    about: "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation. The room faces the peaceful first patio and is outfitted with a twofold bed.",
    rules: "Excellent, open and calm 2 room loft in the energetic zone of Prenzlauer Berg with extraordinary shopping, bistros, eateries and open transportation.",
    reviews: reviews,
  ),
];