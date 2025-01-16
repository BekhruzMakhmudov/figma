import 'package:figma/model/house_model.dart';
import 'package:flutter/material.dart';

class HouseProperty extends StatelessWidget {
  final HouseModel houseModel;
  const HouseProperty({
    super.key,
    required this.houseModel,
  });
  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 5, // Horizontal spacing
        runSpacing: 5,
        children: houseModel.houseDetail,
    );
  }
}
