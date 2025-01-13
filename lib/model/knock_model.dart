import 'package:figma/data/knock_data.dart';
import 'package:figma/model/house_model.dart';

class KnockModel {
  final String date;
  final String period;
  final HouseModel house;
  KnockStatus status;
  CancelReason? reason;
  String? additional;
  KnockModel({
    required this.date,
    required this.period,
    required this.house,
    required this.status,
    this.reason,
    this.additional,
  });
}
