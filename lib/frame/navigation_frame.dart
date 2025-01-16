import 'package:figma/screen/house/houses_list_screen.dart';
import 'package:figma/screen/knock/knock_status_screen.dart';
import 'package:figma/screen/house/my_houses_list_screen.dart';
import 'package:figma/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:figma/data/user_data.dart';
class NavigationFrame extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final int index;
  const NavigationFrame({
    super.key,
    required this.body,
    this.appBar,
    required this.index,
  });
  @override
  State<StatefulWidget> createState() => _NavigationFrameState();
}

class _NavigationFrameState extends State<NavigationFrame> {
  @override
  Widget build(BuildContext context) {
    final screens = [
      HousesScreen(),
      MyHousesScreen(),
      KnockStatusScreen(),
      ProfileScreen(userModel: users[0],),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: widget.appBar,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: widget.body,
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.index,
        onTap: (newIndex) {
          if (widget.index != newIndex) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => screens[newIndex],
              ),
            );
          }
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
