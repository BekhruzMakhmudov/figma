import 'package:figma/widget/header_text.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  int _currentIndex = 3;

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeaderText(
          text:'Edit Information',
          isLarge: false,
          isBold: true,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 35,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Save',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha(90),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Icon(Icons.person, color: Colors.grey, size: 50),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Upload',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(90),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.grey),
                          ),
                          Text(
                            'peter@gmail.com',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.grey),
                          ),
                          Text(
                            '+38 043 485 45 34',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
