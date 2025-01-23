class AddressModel {
  final String district;
  final String city;
  final String country;
  const AddressModel({
    required this.district,
    required this.city,
    required this.country,
  });
  String get cityCountry {
    return '$city, $country';
  }
  String get districtCity{
    return '$district, $city';
  }
}
