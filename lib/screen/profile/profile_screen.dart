import 'package:figma/data/profile_data.dart';
import 'package:figma/data/user_data.dart';
import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/model/user_model.dart';
import 'package:figma/screen/profile/profile_edit_screen.dart';
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
            ...ProfileOption.values.map(
              (option) => ListTileShadow(
                title: mapProfileString[option]!,
                leading: Icon(
                  mapProfileIcon[option],
                  color: (option == ProfileOption.logOut) ? Colors.red : null,
                ),
                color: (option == ProfileOption.logOut) ? Colors.red : null,
                nextScreen: mapProfileScreen[option]!,
                hasAlert: (option == ProfileOption.logOut) ? true : null,
              ),
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
