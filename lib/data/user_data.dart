import 'package:figma/model/user_model.dart';
import 'package:flutter/material.dart';

List<UserModel> users = [
  UserModel(
    avatar: Colors.grey,
    name: "Bekhruz Makhmudov",
    email: "a@a.ru",
    password: "Mb310502",
    phone: "+38 043 485 45 34",
    housesId: [
      1,
      2,
    ],
    isActive: true,
  ),
  UserModel(
    avatar: Colors.red,
    name: "Peter Parker",
    email: "b@b.ru",
    password: "Ab123456",
    phone: "+12 345 678 90 10",
    housesId: [
      0
    ],
    isActive: false,
  ),
];
