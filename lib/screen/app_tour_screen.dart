import 'package:flutter/material.dart';

class AppTourScreen extends StatefulWidget {
  const AppTourScreen({super.key});
  @override
  State<AppTourScreen> createState() => _AppTourScreenState();
}

class _AppTourScreenState extends State<AppTourScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<AppTourContent> _contents = [
    AppTourContent(
      title: "Welcome to\nKnock-Knock!",
      description: "The app to exchange safely\nyour accommodation",
      //image: "assets/logo.png",
      currentPage: 0,
    ),
    AppTourContent(
      title:
          "When your accommodation\nis uploaded on our website\nyou can start knocking",
      icon: Icons.house,
      //image: "assets/
      currentPage: 1,
    ),
    AppTourContent(
      title: "Manage available periods\nfor your accommodation",
      icon: Icons.calendar_month,
      //image: "assets/calendar.png",
      currentPage: 2,
    ),
    AppTourContent(
      title: "Easy to chat and\ninteract with people", icon: Icons.chat,
      //image: "assets/chat.png",
      currentPage: 3,
    ),
    AppTourContent(
      title: "Receive notifications\nwith interesting matches",
      icon: Icons.notifications,
      //image: "assets/notification.png",
      currentPage: 4,
    ),
    AppTourContent(
      title: "Ready to live in\nnew places?",
      buttonText: "Let's start!",
      currentPage: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Skip',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int next) {
                  setState(() {
                    _currentPage = next;
                  });
                },
                itemCount: _contents.length,
                itemBuilder: (context, index) {
                  return AppTourPage(content: _contents[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_currentPage > 0)
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                Row(
                  children: [
                    Text(
                      '0${_currentPage + 1}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      ' / 0${_contents.length}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                if (_currentPage < _contents.length - 1)
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
              ],
            ),
          ],
        ),
    );
  }
}

class AppTourContent {
  final String title;
  final String? description;
  final IconData? icon;
  final String? buttonText;
  final int currentPage;

  AppTourContent({
    required this.title,
    this.description,
    this.icon,
    this.buttonText,
    this.currentPage = 0,
  });
}

class AppTourPage extends StatelessWidget {
  final AppTourContent content;

  const AppTourPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (content.icon != null && content.currentPage % 2 == 0)
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Icon(content.icon, size: 50, color: Colors.white),
            ),
          Text(
            content.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          if (content.description != null)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                content.description!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
          if (content.icon != null && content.currentPage % 2 == 1)
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Icon(content.icon, size: 50, color: Colors.white),
            ),
          if (content.buttonText != null)
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  content.buttonText!,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
