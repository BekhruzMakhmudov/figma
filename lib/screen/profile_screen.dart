import 'package:figma/widget/profile_option.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
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
      body: Column(
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
                    borderRadius: BorderRadius.circular(12), // Rounded corners
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
            onTap: () {},
          ),
          ProfileOption(
            title: "Log out",
            icon: Icons.logout,
            color: Colors.red,
            onTap: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue, // Active tab color
        unselectedItemColor: Colors.grey, // Inactive tab color
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Houses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Knock-knocks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
