class HouseModel{
  final bool isVerified;
  final double? rating;
  final String address;
  final String? location;
  final String title;
  final int guests;
  final int bedrooms;
  final int beds;
  final int bathrooms;
  final String? imageUrl;
  final String? about;
  final String? rules;
  List? amenities;
  HouseModel({
    required this.isVerified,
    this.rating,
    this.location,
    required this.address,
    required this.title,
    required this.guests,
    required this.bedrooms,
    required this.beds,
    required this.bathrooms,
    this.imageUrl,
    this.about,
    this.rules,
    this.amenities,
  });
}