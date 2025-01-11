import 'package:flutter/material.dart';

class UserModel {
  final Color avatar;
  final String name;
  final String email;
  final String password;
  final String phone;
  final bool isActive;
  UserModel({
    required this.avatar,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.isActive,
  });
}
