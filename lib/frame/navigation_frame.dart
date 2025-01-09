import 'package:figma/data/review_data.dart';
import 'package:figma/screen/houses_list_screen.dart';
import 'package:figma/screen/my_houses_list_screen.dart';
import 'package:figma/screen/profile_screen.dart';
import 'package:figma/screen/review_screen.dart';
import 'package:flutter/material.dart';

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
      ReviewScreen(reviews: reviews),
      ProfileScreen()
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: widget.appBar,
      body: SafeArea(child: widget.body),
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
