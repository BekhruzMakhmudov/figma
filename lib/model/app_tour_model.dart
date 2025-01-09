import 'package:flutter/material.dart';

class AppTourModel {
  final String title;
  final String? description;
  final IconData? icon;
  final String? buttonText;
  final int currentPage;

  AppTourModel({
    required this.title,
    this.description,
    this.icon,
    this.buttonText,
    required this.currentPage,
  });
}
