import 'package:figma/data/user_data.dart';
import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/model/user_model.dart';
import 'package:figma/screen/form/change_password_screen.dart';
import 'package:figma/screen/house/favorite_houses_screen.dart';
import 'package:figma/screen/house/my_houses_list_screen.dart';
import 'package:figma/screen/period/available_period_screen.dart';
import 'package:figma/screen/profile/profile_edit_screen.dart';
import 'package:figma/screen/review_screen.dart';
import 'package:figma/screen/form/sign_in_screen.dart';
import 'package:figma/widget/alert_cancel.dart';
import 'package:figma/widget/house/house_card.dart';
import 'package:figma/widget/profile_card.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:figma/widget/list_tile_shadow.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final UserModel userModel;
  const ProfileScreen({
    super.key,
    required this.userModel,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return (widget.userModel == users[0])
        ? _buildMyProfile()
        : _buildOtherProfile(user: widget.userModel);
  }

  Widget _buildMyProfile() {
    return NavigationFrame(
      index: 3,
      appBar: AppBar(
        title: HeaderText(
          text: "Profile",
          isBold: true,
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileEditScreen(),
                ),
              );
            },
            child: Text(
              "Edit",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCard(
              color: widget.userModel.avatar,
              size: 100,
              title: HeaderText(
                text: widget.userModel.name,
                isBold: true,
                isLarge: false,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Joined: Oct 2020",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(widget.userModel.email),
                  Text(widget.userModel.phone),
                ],
              ),
            ),
            ListTileShadow(
              title: "My houses",
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHousesScreen(),
                  ),
                );
              },
            ),
            ListTileShadow(
              title: "Available periods",
              leading: Icon(Icons.calendar_month),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AvailablePeriodScreen(),
                  ),
                );
              },
            ),
            ListTileShadow(
              title: "Favourites",
              leading: Icon(Icons.favorite_border),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteHousesScreen(),
                  ),
                );
              },
            ),
            ListTileShadow(
              title: "Reviews",
              leading: Icon(Icons.star_border),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewScreen(),
                  ),
                );
              },
            ),
            ListTileShadow(
              title: "Change password",
              leading: Icon(Icons.key),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordScreen(),
                  ),
                );
              },
            ),
            ListTileShadow(
              title: "Log out",
              leading: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              color: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertCancel(
                    title: "Are you sure you want to log out?",
                    textButton: "Log out",
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherProfile({required UserModel user}) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ProfileCard(
              color: user.avatar,
              size: 100,
              title: HeaderText(
                text: user.name,
                isBold: true,
                isLarge: false,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Houses: ${widget.userModel.housesList.length}'),
                  Divider(),
                  Row(
                    children: [
                      Text('Activity: '),
                      Text(
                        widget.userModel.isActive ? 'Online' : 'Offline',
                        style: TextStyle(
                            color: widget.userModel.isActive
                                ? Colors.green
                                : Colors.grey),
                      ),
                    ],
                  ),
                  Text(
                    "Joined: Oct 2020",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ...user.housesList.map(
                    (house) => HouseCard(
                      houseModel: house,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
