import 'package:figma/model/house_model.dart';
import 'package:flutter/material.dart';

class HouseDetail extends StatelessWidget {
  final HouseModel houseModel;
  const HouseDetail({
    super.key,
    required this.houseModel,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Wrap(
        spacing: 10.0, // Horizontal spacing
        runSpacing: 10.0,
        children: houseModel.houseDetail,
      ),
    );
  }
}
