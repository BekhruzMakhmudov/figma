import 'package:figma/frame/navigation_frame.dart';
import 'package:figma/screen/change_password_screen.dart';
import 'package:figma/screen/profile_edit_screen.dart';
import 'package:figma/screen/sign_in_screen.dart';
import 'package:figma/widget/alert_cancel.dart';
import 'package:figma/widget/text/header_text.dart';
import 'package:figma/widget/profile_option.dart';
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
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Norbert Blumenberg",
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
                        Text("blumenbergnorbie@gmail.com"),
                        SizedBox(height: 5),
                        Text("+38 043 485 45 34"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),
            ProfileOption(
              title: "My houses",
              icon: Icons.home,
              onTap: () {},
            ),
            ProfileOption(
              title: "Available periods",
              icon: Icons.calendar_today_outlined,
              onTap: () {},
            ),
            ProfileOption(
              title: "Favourites",
              icon: Icons.favorite_border,
              onTap: () {},
            ),
            ProfileOption(
              title: "Reviews",
              icon: Icons.star_border,
              onTap: () {},
            ),
            ProfileOption(
              title: "Change password",
              icon: Icons.lock_outline,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordScreen(),
                  ),
                );
              },
            ),
            ProfileOption(
              title: "Log out",
              icon: Icons.logout,
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
