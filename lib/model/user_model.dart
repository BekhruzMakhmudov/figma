import 'package:figma/model/house_model.dart';
import 'package:flutter/material.dart';

class UserModel {
  static int nextId = 0;
  final int id;
  final Color avatar;
  final String name;
  final String email;
  final String password;
  final String phone;
  List<int> housesId;
  UserModel({
    required this.avatar,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.housesId=const [],
  }) : id = nextId++;
  List<HouseModel> get houses{
    List<HouseModel> result=[];
    for(var id in housesId){
      for(var house in houses){
        if(id==house.id) result.add(house);
      }
    }
    return result;
  }
}
