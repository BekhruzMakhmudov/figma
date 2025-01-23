import 'package:figma/screen/screens_for_profile.dart';
import 'package:flutter/material.dart';

enum ProfileOption {
  myHouse(
    icon: Icons.house,
    text: 'My houses',
    widget: MyHousesScreen(),
  ),
  availablePeriod(
    icon: Icons.calendar_month,
    text: 'Available periods',
    widget: AvailablePeriodScreen(),
  ),
  favorite(
    icon: Icons.favorite_border,
    text: 'Favourites',
    widget: FavoriteHousesScreen(),
  ),
  review(
    icon: Icons.star_border,
    text: 'Reviews',
    widget: ReviewScreen(),
  ),
  changePassword(
    icon: Icons.key,
    text: 'Change password',
    widget: ChangePasswordScreen(),
  ),
  logOut(
    icon: Icons.logout,
    text: 'Log out',
    widget: SignInScreen(),
  );

  const ProfileOption({
    required this.icon,
    required this.text,
    required this.widget,
  });
  final IconData icon;
  final String text;
  final Widget widget;
}
