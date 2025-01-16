import 'package:figma/screen/form/change_password_screen.dart';
import 'package:figma/screen/form/sign_up_screen.dart';
import 'package:figma/screen/house/favorite_houses_screen.dart';
import 'package:figma/screen/house/my_houses_list_screen.dart';
import 'package:figma/screen/period/available_period_screen.dart';
import 'package:figma/screen/review_screen.dart';
import 'package:flutter/material.dart';
enum ProfileOption {
  myHouse,
  availablePeriod,
  favorite,
  review,
  changePassword,
  logOut,
}

final mapProfileString = {
  ProfileOption.myHouse: 'My houses',
  ProfileOption.availablePeriod: 'Available periods',
  ProfileOption.favorite: 'Favourites',
  ProfileOption.review: 'Reviews',
  ProfileOption.changePassword: 'Change password',
  ProfileOption.logOut: 'Log out',
};

final mapProfileIcon = {
  ProfileOption.myHouse:Icons.house,
  ProfileOption.availablePeriod:Icons.calendar_month,
  ProfileOption.favorite:Icons.favorite_border,
  ProfileOption.review:Icons.star_border,
  ProfileOption.changePassword:Icons.key,
  ProfileOption.logOut:Icons.logout,
};

final mapProfileScreen={
  ProfileOption.myHouse:MyHousesScreen(),
  ProfileOption.availablePeriod:AvailablePeriodScreen(),
  ProfileOption.favorite:FavoriteHousesScreen(),
  ProfileOption.review:ReviewScreen(),
  ProfileOption.changePassword:ChangePasswordScreen(),
  ProfileOption.logOut:SignUpScreen(),
};