import 'package:figma/data/user_data.dart';
import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/screen/form/change_password_screen.dart';
import 'package:figma/screen/house/favorite_houses_screen.dart';
import 'package:figma/screen/house/my_houses_list_screen.dart';
import 'package:figma/screen/profile/profile_edit_screen.dart';
import 'package:figma/screen/review_screen.dart';
import 'package:figma/screen/form/sign_in_screen.dart';
import 'package:figma/widget/alert_cancel.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:figma/widget/list_tile_shadow.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
             Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                      color: users[0].avatar,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          users[0].name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Joined: Oct 2020",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(users[0].email),
                        SizedBox(height: 5),
                        Text(users[0].phone),
                      ],
                    ),
                  ),
                ],
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
              onTap: () {},
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
}
