import 'package:figma/model/house_model.dart';
import 'package:flutter/material.dart';
import 'package:figma/data/house_data.dart';
class UserModel {
  static int nextId = 0;
  final int id;
  final Color avatar;
  final String name;
  final String email;
  final String password;
  final String phone;
  List<int> housesId;
  final bool isActive;
  UserModel({
    required this.avatar,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.housesId=const [],
    required this.isActive,
  }) : id = nextId++;
  List<HouseModel> get housesList{
    List<HouseModel> result=[];
    for(var id in housesId){
      result.add(houses[id]);
    }
    return result;
  }
}
